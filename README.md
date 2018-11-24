# home_automation






# Notes for marytts


curl 'http://localhost:59125/process?INPUT_TYPE=TEXT&AUDIO=WAVE&OUTPUT_TYPE=AUDEXT=hallo&VOICE=cmu-bdl'
curl 'http://localhost:59125/process?VOICE=enst-camille-hsmm&LOCALE=en_US&INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&AUDIO=WAVE&INPUT_TEXT=Hello'
curl 'http://localhost:59125/process?VOICE=cmu-slt&LOCALE=en_US&INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&AUDIO=WAVE&INPUT_TEXT=Hello'
curl 'http://localhost:59125/process?VOICE=cmu-bdl&LOCALE=en_US&INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&AUDIO=WAVE&INPUT_TEXT=Hello' |aplay

VOICE=enst-camille&LOCALE=en_US&INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&AUDIO=WAVE&INPUT_TEXT'=Hello

{'VOICE': 'enst-camille', 'LOCALE': 'en_US', 'INPUT_TYPE': 'TEXT', 'OUTPUT_TYPE': 'AUDIO', 'AUDIO': 'WAVE', 'INPUT_TEXT': "Hello, i'm here for you"}




 FOO="bits1 cmu-bdl cmu-bdl-hsmm cmu-rms cmu-rms-hsmm cmu-slt cmu-slt-hsmm dfki-obadiah dfki-obadiah-hsmm dfki-poppy dfki-poppy-hsmm dfki-prudence dfki-prudence-hsmm dfki-spike dfki-spike-hsmm" for i in "$FOO"; do echo $i; done;


for i in bits1 cmu-rms cmu-rms-hsmm  dfki-obadiah dfki-prudence dfki-spike dfki-spike-hsmm; do echo $i; curl "http://localhost:59125/process?VOICE=${i}&LOCALE=en_US&INPUT_TYPE=TEXT&OUTPUT_TYPE=AUDIO&AUDIO=WAVE&INPUT_TEXT=A%20very%20large%20number%20of%20published%20documents%20contain%20text%20only" > $i; mplayer $i  ;done;
