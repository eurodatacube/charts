This app polls your EDC Sentinel Hub Mass Processing requests for status changes\* and logs the duration of requests to a file called `duration.csv`.

\* observed request status change: `status==PROCESSING && userAction==START --> status==DONE`

## Usage instructions

1. Start Sentinel Hub Batch API requests
2. Wait until their status switches to `DONE`
3. Click the link "Download `duration.csv`"
