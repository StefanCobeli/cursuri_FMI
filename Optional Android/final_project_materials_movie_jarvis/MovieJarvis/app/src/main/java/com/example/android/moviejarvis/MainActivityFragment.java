package com.example.android.moviejarvis;

import android.net.Uri;
import android.os.AsyncTask;
import android.support.v4.app.Fragment;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

/**
 * A placeholder fragment containing a simple view.
 */
public class MainActivityFragment extends Fragment {


    public MainActivityFragment() {


    }

    private ArrayAdapter<String> mAdapterMovieTitle;
    private ArrayList<String> mListMovieIds;

    public void onStart() {
        super.onStart();
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        View rootView = inflater.inflate(R.layout.fragment_main, container, false);

        ListView listview_movie = (ListView) rootView.findViewById(R.id.listview_movie);


        mListMovieIds = new ArrayList<>();

        mAdapterMovieTitle = new ArrayAdapter<String>(
                getActivity(),
                R.layout.fragment_main,
                R.id.textview_movie_item,
                new ArrayList<String>()
        );
        listview_movie.setAdapter(mAdapterMovieTitle);

        GetMoviesTask movies = new GetMoviesTask();
        movies.execute();

        listview_movie.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {

                String movieTitle = mAdapterMovieTitle.getItem(position);
                String movieId = mListMovieIds.get(position);
                Toast.makeText(getActivity(), movieId, Toast.LENGTH_SHORT).show();


            }
        });

        return rootView;
    }

    public class GetMoviesTask extends AsyncTask<Void, Void, String> {


        @Override
        protected String doInBackground(Void... params) {

            HttpURLConnection urlConnection = null;
            BufferedReader reader = null;

            //The string recived from the request
            String movies_json_raw_str = null;

            try {

                final String MOVIES_BASE_URL =
                        "http://api.themoviedb.org/3/movie/now_playing?";
                final String APPID_PARAM = "api_key";

                Uri builtUri = Uri.parse(MOVIES_BASE_URL).buildUpon()
                        .appendQueryParameter(APPID_PARAM, "42ba87716dc7d6d5b120ce09f7f0837a")
                        .build();
                URL url = new URL(builtUri.toString());

                //Create request to movieDB
                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setRequestMethod("GET");
                urlConnection.connect();

                InputStream inputStream = urlConnection.getInputStream();
                StringBuffer buffer = new StringBuffer();

                if (inputStream == null) {

                    return null;

                }

                reader = new BufferedReader(new InputStreamReader(inputStream));
                String line;
                while ((line = reader.readLine()) != null) {

                    buffer.append(line + "\n");

                }

                if (buffer.length() == 0) {
                    // Stream was empty.  No point in parsing.
                    return null;
                }

                movies_json_raw_str = buffer.toString();


            } catch (IOException e) {

                Toast.makeText(getActivity(), "Please try again later!", Toast.LENGTH_SHORT);
                return null;

            } finally {
                if (urlConnection != null) {

                    urlConnection.disconnect();

                }
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (final IOException e) {

                        Toast.makeText(getActivity(), "Error closing stream", Toast.LENGTH_SHORT);

                    }


                }


                return movies_json_raw_str;


            }


        }

        @Override
        protected void onPostExecute(String result) {
            mAdapterMovieTitle.clear();
            try {
                JSONObject jsonObject = new JSONObject(result);
                Log.e("onPostExecute", "page: " + jsonObject.getInt("page"));

                JSONArray jsonArray = jsonObject.getJSONArray("results");
                for (int i = 0; i <= jsonArray.length(); i++) {

                    JSONObject object = jsonArray.getJSONObject(i);
                    Log.e("onPostExecute", "title: " + object.getString("title"));
                    mAdapterMovieTitle.add(((Integer) (i + 1)).toString() + ". " + object.getString("title"));
                    mListMovieIds.add(object.getString("id"));

                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            //    mAdapterMovieTitle.add(result);
            mAdapterMovieTitle.notifyDataSetChanged();

        }


    }


}
