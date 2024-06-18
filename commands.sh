shuchimishra_ucla@cloudshell:~$ gcloud config set project "shuchi-project"
Updated property [core/project].

shuchimishra_ucla@cloudshell:~ (shuchi-project)$ gsutil ls
gs://tf-flask-app/

shuchimishra_ucla@cloudshell:~ (shuchi-project)$ gsutil ls gs://tf-flask-app/
gs://tf-flask-app/Dockerfile
gs://tf-flask-app/SAFlask.py
gs://tf-flask-app/SAFlaskFinal.py
gs://tf-flask-app/SAGunicorn.py
gs://tf-flask-app/SAWaitress.py
gs://tf-flask-app/sa_encoder.vocab.tokens
gs://tf-flask-app/sentiment_analysis.hdf5

shuchimishra_ucla@cloudshell:~ (shuchi-project)$ gsutil cp -r gs://tf-flask-app/ .
Copying gs://tf-flask-app/Dockerfile...
Copying gs://tf-flask-app/SAFlask.py...                                         
Copying gs://tf-flask-app/SAFlaskFinal.py...                                    
Copying gs://tf-flask-app/SAGunicorn.py...                                      
- [4 files][  4.1 KiB/  4.1 KiB]                                                
==> NOTE: You are performing a sequence of gsutil operations that may
run significantly faster if you instead use gsutil -m cp ... Please
see the -m section under "gsutil help options" for further information
about when gsutil -m can be advantageous.

Copying gs://tf-flask-app/SAWaitress.py...
Copying gs://tf-flask-app/sa_encoder.vocab.tokens...                            
Copying gs://tf-flask-app/sentiment_analysis.hdf5...                            
\ [7 files][113.7 MiB/113.7 MiB]                                                
Operation completed over 7 objects/113.7 MiB.       

shuchimishra_ucla@cloudshell:~ (shuchi-project)$ cd tf-flask-app/

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ ls -lart
total 116444
drwxr-x--- 10 shuchimishra_ucla shuchimishra_ucla      4096 Jun 18 21:43 ..
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla       349 Jun 18 21:43 Dockerfile
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla      1937 Jun 18 21:43 SAFlask.py
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla      1739 Jun 18 21:43 SAFlaskFinal.py
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla       174 Jun 18 21:43 SAGunicorn.py
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla       202 Jun 18 21:43 SAWaitress.py
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla    578877 Jun 18 21:43 sa_encoder.vocab.tokens
-rw-rw-r--  1 shuchimishra_ucla shuchimishra_ucla 118625184 Jun 18 21:43 sentiment_analysis.hdf5
drwxrwxr-x  2 shuchimishra_ucla shuchimishra_ucla      4096 Jun 18 21:43 .   