This app polls your EDC Sentinel Hub Mass Processing requests for status changes\* and logs the duration of requests to a file called `duration.csv`.

\* observed request status change: `status==PROCESSING && userAction==START --> status==DONE`