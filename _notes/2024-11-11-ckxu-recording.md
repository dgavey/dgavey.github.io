---
layout: note
title: Recording a radio livestream
date: 2024-11-11 11:00:00 -0700
category: til

---

I needed to record a livestream of the college radio station where my son now has a program.

I used FFMPEG and the script below in order to do this.  I added a cron job for the time of his program.  I should get them all recorded now when I can't listen live.

```
#!/bin/bash

# Set the input stream URL
STREAM_URL="https://stream.statsradio.com/8156/stream"

# Get the current date in the format "YYYY-MM-DD"
RECORDING_DATE=$(date +"%Y-%m-%d")

# Set the output file name
OUTPUT_FILE="/Users/derek/ckxu/ckxu_recording_$RECORDING_DATE.mp3"

# Record the stream using ffmpeg for 1 hour and 10 minutes
/opt/homebrew/bin/ffmpeg -i "$STREAM_URL" -t 4200 -c copy "$OUTPUT_FILE"
```