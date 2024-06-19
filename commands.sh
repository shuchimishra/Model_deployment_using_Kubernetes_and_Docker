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

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud config get-value project
Your active configuration is: [cloudshell-11099]
shuchi-project

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud builds submit --tag gcr.io/shuchi-project/saflask-gke .
Creating temporary archive of 8 file(s) totalling 113.7 MiB before compression.
Uploading tarball of [.] to [gs://shuchi-project_cloudbuild/source/1718750681.519636-667a66ecca4d49d79295b0b78e97c6af.tgz]
Created [https://cloudbuild.googleapis.com/v1/projects/shuchi-project/locations/global/builds/f261544f-089b-4983-b458-04d8c7e1e4c3].
Logs are available at [ https://console.cloud.google.com/cloud-build/builds/f261544f-089b-4983-b458-04d8c7e1e4c3?project=338441565703 ].
Waiting for build to complete. Polling interval: 1 second(s).
--------------------------------------------------------------------------------------------------------------- REMOTE BUILD OUTPUT ---------------------------------------------------------------------------------------------------------------
starting build "f261544f-089b-4983-b458-04d8c7e1e4c3"

FETCHSOURCE
Fetching storage object: gs://shuchi-project_cloudbuild/source/1718750681.519636-667a66ecca4d49d79295b0b78e97c6af.tgz#1718750694763234
Copying gs://shuchi-project_cloudbuild/source/1718750681.519636-667a66ecca4d49d79295b0b78e97c6af.tgz#1718750694763234...
\ [1 files][ 88.2 MiB/ 88.2 MiB]                                                
Operation completed over 1 objects/88.2 MiB.
BUILD
Already have image (with digest): gcr.io/cloud-builders/docker
Sending build context to Docker daemon  119.2MB
Step 1/6 : FROM python:3.7-slim
3.7-slim: Pulling from library/python
a803e7c4b030: Pulling fs layer
bf3336e84c8e: Pulling fs layer
8973eb85275f: Pulling fs layer
f9afc3cc0135: Pulling fs layer
39312d8b4ab7: Pulling fs layer
f9afc3cc0135: Waiting
39312d8b4ab7: Waiting
bf3336e84c8e: Verifying Checksum
bf3336e84c8e: Download complete
a803e7c4b030: Verifying Checksum
a803e7c4b030: Download complete
8973eb85275f: Verifying Checksum
8973eb85275f: Download complete
f9afc3cc0135: Verifying Checksum
f9afc3cc0135: Download complete
39312d8b4ab7: Verifying Checksum
39312d8b4ab7: Download complete
a803e7c4b030: Pull complete
bf3336e84c8e: Pull complete
8973eb85275f: Pull complete
f9afc3cc0135: Pull complete
39312d8b4ab7: Pull complete
Digest: sha256:b53f496ca43e5af6994f8e316cf03af31050bf7944e0e4a308ad86c001cf028b
Status: Downloaded newer image for python:3.7-slim
 a255ffcb469f
Step 2/6 : ENV APP_HOME /app
 Running in 1e7259244abc
Removing intermediate container 1e7259244abc
 50b6cc80429c
Step 3/6 : WORKDIR $APP_HOME
 Running in 221e917340ae
Removing intermediate container 221e917340ae
 c78413dcd0de
Step 4/6 : COPY . ./
 62f641a8e96f
Step 5/6 : RUN pip install tensorflow==2.1.0 tensorflow-datasets Flask gunicorn healthcheck google-cloud-logging
 Running in 444dff1aa238
Collecting tensorflow==2.1.0
  Downloading tensorflow-2.1.0-cp37-cp37m-manylinux2010_x86_64.whl (421.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 421.8/421.8 MB 3.4 MB/s eta 0:00:00
Collecting tensorflow-datasets
  Downloading tensorflow_datasets-4.8.2-py3-none-any.whl (5.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.3/5.3 MB 63.2 MB/s eta 0:00:00
Collecting Flask
  Downloading Flask-2.2.5-py3-none-any.whl (101 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 101.8/101.8 kB 14.7 MB/s eta 0:00:00
Collecting gunicorn
  Downloading gunicorn-22.0.0-py3-none-any.whl (84 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 84.4/84.4 kB 11.0 MB/s eta 0:00:00
Collecting healthcheck
  Downloading healthcheck-1.3.3.tar.gz (5.6 kB)
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Collecting google-cloud-logging
  Downloading google_cloud_logging-3.10.0-py2.py3-none-any.whl (213 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 213.4/213.4 kB 26.4 MB/s eta 0:00:00
Collecting astor>=0.6.0
  Downloading astor-0.8.1-py2.py3-none-any.whl (27 kB)
Collecting grpcio>=1.8.6
  Downloading grpcio-1.62.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (5.6 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.6/5.6 MB 23.8 MB/s eta 0:00:00
Collecting scipy==1.4.1
  Downloading scipy-1.4.1-cp37-cp37m-manylinux1_x86_64.whl (26.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 26.1/26.1 MB 45.7 MB/s eta 0:00:00
Collecting opt-einsum>=2.3.2
  Downloading opt_einsum-3.3.0-py3-none-any.whl (65 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 65.5/65.5 kB 10.2 MB/s eta 0:00:00
Collecting wrapt>=1.11.1
  Downloading wrapt-1.16.0-cp37-cp37m-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (77 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 77.5/77.5 kB 11.6 MB/s eta 0:00:00
Requirement already satisfied: wheel>=0.26 in /usr/local/lib/python3.7/site-packages (from tensorflow==2.1.0) (0.41.2)
Collecting google-pasta>=0.1.6
  Downloading google_pasta-0.2.0-py3-none-any.whl (57 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.5/57.5 kB 8.2 MB/s eta 0:00:00
Collecting protobuf>=3.8.0
  Downloading protobuf-4.24.4-cp37-abi3-manylinux2014_x86_64.whl (311 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 311.6/311.6 kB 29.5 MB/s eta 0:00:00
Collecting keras-applications>=1.0.8
  Downloading Keras_Applications-1.0.8-py3-none-any.whl (50 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 50.7/50.7 kB 7.8 MB/s eta 0:00:00
Collecting tensorboard<2.2.0,>=2.1.0
  Downloading tensorboard-2.1.1-py3-none-any.whl (3.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.8/3.8 MB 63.2 MB/s eta 0:00:00
Collecting keras-preprocessing>=1.1.0
  Downloading Keras_Preprocessing-1.1.2-py2.py3-none-any.whl (42 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 42.6/42.6 kB 6.0 MB/s eta 0:00:00
Collecting absl-py>=0.7.0
  Downloading absl_py-2.1.0-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.7/133.7 kB 16.7 MB/s eta 0:00:00
Collecting tensorflow-estimator<2.2.0,>=2.1.0rc0
  Downloading tensorflow_estimator-2.1.0-py2.py3-none-any.whl (448 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 449.0/449.0 kB 37.2 MB/s eta 0:00:00
Collecting numpy<2.0,>=1.16.0
  Downloading numpy-1.21.6-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.7 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 15.7/15.7 MB 55.7 MB/s eta 0:00:00
Collecting termcolor>=1.1.0
  Downloading termcolor-2.3.0-py3-none-any.whl (6.9 kB)
Collecting gast==0.2.2
  Downloading gast-0.2.2.tar.gz (10 kB)
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Collecting six>=1.12.0
  Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
Collecting dm-tree
  Downloading dm_tree-0.1.8-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (153 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 153.8/153.8 kB 21.7 MB/s eta 0:00:00
Collecting promise
  Downloading promise-2.3.tar.gz (19 kB)
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Collecting etils[enp,epath]>=0.9.0
  Downloading etils-0.9.0-py3-none-any.whl (140 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 140.1/140.1 kB 20.6 MB/s eta 0:00:00
Collecting dill
  Downloading dill-0.3.7-py3-none-any.whl (115 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 115.3/115.3 kB 16.3 MB/s eta 0:00:00
Collecting typing-extensions
  Downloading typing_extensions-4.7.1-py3-none-any.whl (33 kB)
Collecting requests>=2.19.0
  Downloading requests-2.31.0-py3-none-any.whl (62 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 62.6/62.6 kB 8.7 MB/s eta 0:00:00
Collecting tensorflow-metadata
  Downloading tensorflow_metadata-1.12.0-py3-none-any.whl (52 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 52.3/52.3 kB 7.1 MB/s eta 0:00:00
Collecting importlib-resources
  Downloading importlib_resources-5.12.0-py3-none-any.whl (36 kB)
Collecting toml
  Downloading toml-0.10.2-py2.py3-none-any.whl (16 kB)
Collecting psutil
  Downloading psutil-6.0.0-cp36-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (290 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 290.5/290.5 kB 35.3 MB/s eta 0:00:00
Collecting tqdm
  Downloading tqdm-4.66.4-py3-none-any.whl (78 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 78.3/78.3 kB 12.3 MB/s eta 0:00:00
Collecting click
  Downloading click-8.1.7-py3-none-any.whl (97 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 97.9/97.9 kB 15.1 MB/s eta 0:00:00
Collecting importlib-metadata>=3.6.0
  Downloading importlib_metadata-6.7.0-py3-none-any.whl (22 kB)
Collecting Werkzeug>=2.2.2
  Downloading Werkzeug-2.2.3-py3-none-any.whl (233 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 233.6/233.6 kB 26.5 MB/s eta 0:00:00
Collecting itsdangerous>=2.0
  Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Collecting Jinja2>=3.0
  Downloading jinja2-3.1.4-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.3/133.3 kB 17.8 MB/s eta 0:00:00
Collecting packaging
  Downloading packaging-24.0-py3-none-any.whl (53 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 53.5/53.5 kB 8.2 MB/s eta 0:00:00
Collecting google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1
  Downloading google_api_core-2.19.0-py3-none-any.whl (139 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 139.0/139.0 kB 7.7 MB/s eta 0:00:00
Collecting google-cloud-core<3.0.0dev,>=2.0.0
  Downloading google_cloud_core-2.4.1-py2.py3-none-any.whl (29 kB)
Collecting google-cloud-audit-log<1.0.0dev,>=0.1.0
  Downloading google_cloud_audit_log-0.2.5-py2.py3-none-any.whl (12 kB)
Collecting proto-plus<2.0.0dev,>=1.22.0
  Downloading proto_plus-1.23.0-py3-none-any.whl (48 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 48.8/48.8 kB 6.1 MB/s eta 0:00:00
Collecting grpc-google-iam-v1<1.0.0dev,>=0.12.4
  Downloading grpc_google_iam_v1-0.13.0-py2.py3-none-any.whl (25 kB)
Collecting google-cloud-appengine-logging<2.0.0dev,>=0.1.0
  Downloading google_cloud_appengine_logging-1.4.3-py2.py3-none-any.whl (15 kB)
Collecting google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1
  Downloading google_auth-2.30.0-py2.py3-none-any.whl (193 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 193.7/193.7 kB 25.0 MB/s eta 0:00:00
Collecting zipp
  Downloading zipp-3.15.0-py3-none-any.whl (6.8 kB)
Collecting googleapis-common-protos<2.0.dev0,>=1.56.2
  Downloading googleapis_common_protos-1.63.1-py2.py3-none-any.whl (229 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 229.2/229.2 kB 27.7 MB/s eta 0:00:00
Collecting grpcio-status<2.0.dev0,>=1.33.2
  Downloading grpcio_status-1.62.2-py3-none-any.whl (14 kB)
Collecting cachetools<6.0,>=2.0.0
  Downloading cachetools-5.3.3-py3-none-any.whl (9.3 kB)
Collecting rsa<5,>=3.1.4
  Downloading rsa-4.9-py3-none-any.whl (34 kB)
Collecting pyasn1-modules>=0.2.1
  Downloading pyasn1_modules-0.3.0-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.3/181.3 kB 25.9 MB/s eta 0:00:00
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-2.1.5-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Collecting h5py
  Downloading h5py-3.8.0-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.3 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.3/4.3 MB 69.6 MB/s eta 0:00:00
Collecting urllib3<3,>=1.21.1
  Downloading urllib3-2.0.7-py3-none-any.whl (124 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 124.2/124.2 kB 19.3 MB/s eta 0:00:00
Collecting certifi>=2017.4.17
  Downloading certifi-2024.6.2-py3-none-any.whl (164 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 164.4/164.4 kB 24.3 MB/s eta 0:00:00
Collecting idna<4,>=2.5
  Downloading idna-3.7-py3-none-any.whl (66 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 66.8/66.8 kB 11.2 MB/s eta 0:00:00
Collecting charset-normalizer<4,>=2
  Downloading charset_normalizer-3.3.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (136 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 136.8/136.8 kB 21.7 MB/s eta 0:00:00
Requirement already satisfied: setuptools>=41.0.0 in /usr/local/lib/python3.7/site-packages (from tensorboard<2.2.0,>=2.1.0->tensorflow==2.1.0) (57.5.0)
Collecting markdown>=2.6.8
  Downloading Markdown-3.4.4-py3-none-any.whl (94 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 94.2/94.2 kB 14.3 MB/s eta 0:00:00
Collecting google-auth-oauthlib<0.5,>=0.4.1
  Downloading google_auth_oauthlib-0.4.6-py2.py3-none-any.whl (18 kB)
Collecting tensorboard<2.2.0,>=2.1.0
  Downloading tensorboard-2.1.0-py3-none-any.whl (3.8 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 3.8/3.8 MB 69.1 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of six to determine which version is compatible with other requirements. This could take a while.
Collecting six>=1.12.0
  Downloading six-1.15.0-py2.py3-none-any.whl (10 kB)
INFO: pip is looking at multiple versions of requests to determine which version is compatible with other requirements. This could take a while.
Collecting requests>=2.19.0
  Downloading requests-2.30.0-py3-none-any.whl (62 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 62.5/62.5 kB 10.4 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of protobuf to determine which version is compatible with other requirements. This could take a while.
Collecting protobuf>=3.8.0
  Downloading protobuf-4.24.3-cp37-abi3-manylinux2014_x86_64.whl (311 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 311.6/311.6 kB 34.3 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of proto-plus to determine which version is compatible with other requirements. This could take a while.
Collecting proto-plus<2.0.0dev,>=1.22.0
  Downloading proto_plus-1.22.3-py3-none-any.whl (48 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 48.1/48.1 kB 7.3 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of opt-einsum to determine which version is compatible with other requirements. This could take a while.
Collecting opt-einsum>=2.3.2
  Downloading opt_einsum-3.2.1-py3-none-any.whl (63 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 63.5/63.5 kB 10.8 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of numpy to determine which version is compatible with other requirements. This could take a while.
Collecting numpy<2.0,>=1.16.0
  Downloading numpy-1.21.5-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.7 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 15.7/15.7 MB 63.2 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of keras-preprocessing to determine which version is compatible with other requirements. This could take a while.
Collecting keras-preprocessing>=1.1.0
  Downloading Keras_Preprocessing-1.1.1-py2.py3-none-any.whl (42 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 42.6/42.6 kB 6.9 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of keras-applications to determine which version is compatible with other requirements. This could take a while.
INFO: pip is looking at multiple versions of jinja2 to determine which version is compatible with other requirements. This could take a while.
Collecting Jinja2>=3.0
  Downloading Jinja2-3.1.3-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.2/133.2 kB 20.6 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of itsdangerous to determine which version is compatible with other requirements. This could take a while.
Collecting itsdangerous>=2.0
  Downloading itsdangerous-2.1.1-py3-none-any.whl (15 kB)
INFO: pip is looking at multiple versions of importlib-metadata to determine which version is compatible with other requirements. This could take a while.
Collecting importlib-metadata>=3.6.0
  Downloading importlib_metadata-6.6.0-py3-none-any.whl (22 kB)
INFO: pip is looking at multiple versions of grpcio to determine which version is compatible with other requirements. This could take a while.
Collecting grpcio>=1.8.6
  Downloading grpcio-1.62.1-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (5.6 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.6/5.6 MB 75.2 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of grpc-google-iam-v1 to determine which version is compatible with other requirements. This could take a while.
Collecting grpc-google-iam-v1<1.0.0dev,>=0.12.4
  Downloading grpc_google_iam_v1-0.12.7-py2.py3-none-any.whl (26 kB)
INFO: pip is looking at multiple versions of google-pasta to determine which version is compatible with other requirements. This could take a while.
Collecting google-pasta>=0.1.6
  Downloading google_pasta-0.1.8-py3-none-any.whl (57 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.1/57.1 kB 9.1 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of google-cloud-core to determine which version is compatible with other requirements. This could take a while.
Collecting google-cloud-core<3.0.0dev,>=2.0.0
  Downloading google_cloud_core-2.4.0-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.3.3-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.3.2-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.3.1-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.3.0-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.2.3-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.2.2-py2.py3-none-any.whl (29 kB)
INFO: pip is looking at multiple versions of google-cloud-core to determine which version is compatible with other requirements. This could take a while.
  Downloading google_cloud_core-2.2.1-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.2.0-py2.py3-none-any.whl (29 kB)
  Downloading google_cloud_core-2.1.0-py2.py3-none-any.whl (27 kB)
  Downloading google_cloud_core-2.0.0-py2.py3-none-any.whl (27 kB)
INFO: pip is looking at multiple versions of google-cloud-audit-log to determine which version is compatible with other requirements. This could take a while.
Collecting google-cloud-audit-log<1.0.0dev,>=0.1.0
  Downloading google_cloud_audit_log-0.2.4-py2.py3-none-any.whl (12 kB)
INFO: This is taking longer than usual. You might need to provide the dependency resolver with stricter constraints to reduce runtime. See https://pip.pypa.io/warnings/backtracking for guidance. If you want to abort this run, press Ctrl + C.
INFO: pip is looking at multiple versions of google-cloud-appengine-logging to determine which version is compatible with other requirements. This could take a while.
Collecting google-cloud-appengine-logging<2.0.0dev,>=0.1.0
  Downloading google_cloud_appengine_logging-1.4.2-py2.py3-none-any.whl (15 kB)
  Downloading google_cloud_appengine_logging-1.4.1-py2.py3-none-any.whl (15 kB)
  Downloading google_cloud_appengine_logging-1.4.0-py2.py3-none-any.whl (15 kB)
  Downloading google_cloud_appengine_logging-1.3.2-py2.py3-none-any.whl (16 kB)
INFO: pip is looking at multiple versions of google-auth to determine which version is compatible with other requirements. This could take a while.
Collecting google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1
  Downloading google_auth-2.29.0-py2.py3-none-any.whl (189 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 189.2/189.2 kB 20.5 MB/s eta 0:00:00
  Downloading google_auth-2.28.2-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.9/186.9 kB 25.8 MB/s eta 0:00:00
  Downloading google_auth-2.28.1-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.9/186.9 kB 25.6 MB/s eta 0:00:00
  Downloading google_auth-2.28.0-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.9/186.9 kB 27.7 MB/s eta 0:00:00
  Downloading google_auth-2.27.0-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.8/186.8 kB 27.0 MB/s eta 0:00:00
  Downloading google_auth-2.26.2-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.5/186.5 kB 25.5 MB/s eta 0:00:00
  Downloading google_auth-2.26.1-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.4/186.4 kB 27.2 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of google-auth to determine which version is compatible with other requirements. This could take a while.
  Downloading google_auth-2.26.0-py2.py3-none-any.whl (186 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 186.3/186.3 kB 26.4 MB/s eta 0:00:00
  Downloading google_auth-2.25.2-py2.py3-none-any.whl (184 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 184.2/184.2 kB 26.3 MB/s eta 0:00:00
  Downloading google_auth-2.25.1-py2.py3-none-any.whl (184 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 184.2/184.2 kB 26.7 MB/s eta 0:00:00
  Downloading google_auth-2.23.4-py2.py3-none-any.whl (183 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 183.3/183.3 kB 26.5 MB/s eta 0:00:00
  Downloading google_auth-2.23.3-py2.py3-none-any.whl (182 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 182.3/182.3 kB 24.6 MB/s eta 0:00:00
INFO: This is taking longer than usual. You might need to provide the dependency resolver with stricter constraints to reduce runtime. See https://pip.pypa.io/warnings/backtracking for guidance. If you want to abort this run, press Ctrl + C.
  Downloading google_auth-2.23.2-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 182.0/182.0 kB 26.9 MB/s eta 0:00:00
  Downloading google_auth-2.23.1-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.9/181.9 kB 25.5 MB/s eta 0:00:00
  Downloading google_auth-2.23.0-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.4/181.4 kB 25.4 MB/s eta 0:00:00
Collecting urllib3<2.0
  Downloading urllib3-1.26.19-py2.py3-none-any.whl (143 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 143.9/143.9 kB 22.8 MB/s eta 0:00:00
Collecting google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1
  Downloading google_auth-2.22.0-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.8/181.8 kB 26.2 MB/s eta 0:00:00
  Downloading google_auth-2.21.0-py2.py3-none-any.whl (182 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 182.1/182.1 kB 23.7 MB/s eta 0:00:00
  Downloading google_auth-2.20.0-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.5/181.5 kB 23.9 MB/s eta 0:00:00
  Downloading google_auth-2.19.1-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.3/181.3 kB 27.4 MB/s eta 0:00:00
  Downloading google_auth-2.19.0-py2.py3-none-any.whl (181 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.3/181.3 kB 27.0 MB/s eta 0:00:00
  Downloading google_auth-2.18.1-py2.py3-none-any.whl (178 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 178.9/178.9 kB 25.6 MB/s eta 0:00:00
  Downloading google_auth-2.18.0-py2.py3-none-any.whl (178 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 178.9/178.9 kB 23.5 MB/s eta 0:00:00
  Downloading google_auth-2.17.3-py2.py3-none-any.whl (178 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 178.2/178.2 kB 25.4 MB/s eta 0:00:00
  Downloading google_auth-2.17.2-py2.py3-none-any.whl (178 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 178.2/178.2 kB 26.2 MB/s eta 0:00:00
  Downloading google_auth-2.17.1-py2.py3-none-any.whl (178 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 178.1/178.1 kB 22.5 MB/s eta 0:00:00
  Downloading google_auth-2.17.0-py2.py3-none-any.whl (178 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 178.1/178.1 kB 26.2 MB/s eta 0:00:00
  Downloading google_auth-2.16.3-py2.py3-none-any.whl (177 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 177.5/177.5 kB 25.0 MB/s eta 0:00:00
  Downloading google_auth-2.16.2-py2.py3-none-any.whl (177 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 177.2/177.2 kB 25.8 MB/s eta 0:00:00
  Downloading google_auth-2.16.1-py2.py3-none-any.whl (177 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 177.2/177.2 kB 25.1 MB/s eta 0:00:00
  Downloading google_auth-2.16.0-py2.py3-none-any.whl (177 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 177.8/177.8 kB 25.4 MB/s eta 0:00:00
  Downloading google_auth-2.15.0-py2.py3-none-any.whl (177 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 177.0/177.0 kB 25.9 MB/s eta 0:00:00
  Downloading google_auth-2.14.1-py2.py3-none-any.whl (175 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 175.4/175.4 kB 23.8 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of google-api-core[grpc] to determine which version is compatible with other requirements. This could take a while.
Collecting google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1
  Downloading google_api_core-2.18.0-py3-none-any.whl (138 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 138.3/138.3 kB 20.3 MB/s eta 0:00:00
  Downloading google_api_core-2.17.1-py3-none-any.whl (137 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 137.0/137.0 kB 18.6 MB/s eta 0:00:00
  Downloading google_api_core-2.17.0-py3-none-any.whl (136 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 136.9/136.9 kB 20.8 MB/s eta 0:00:00
  Downloading google_api_core-2.16.2-py3-none-any.whl (135 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 135.2/135.2 kB 17.3 MB/s eta 0:00:00
  Downloading google_api_core-2.16.1-py3-none-any.whl (135 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 135.2/135.2 kB 18.1 MB/s eta 0:00:00
  Downloading google_api_core-2.16.0-py3-none-any.whl (134 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 134.4/134.4 kB 20.0 MB/s eta 0:00:00
  Downloading google_api_core-2.15.0-py3-none-any.whl (121 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 122.0/122.0 kB 14.8 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of google-api-core[grpc] to determine which version is compatible with other requirements. This could take a while.
  Downloading google_api_core-2.14.0-py3-none-any.whl (122 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 122.2/122.2 kB 16.8 MB/s eta 0:00:00
  Downloading google_api_core-2.13.1-py3-none-any.whl (122 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 122.0/122.0 kB 16.2 MB/s eta 0:00:00
  Downloading google_api_core-2.13.0-py3-none-any.whl (122 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 122.0/122.0 kB 17.6 MB/s eta 0:00:00
  Downloading google_api_core-2.12.0-py3-none-any.whl (121 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 121.4/121.4 kB 16.2 MB/s eta 0:00:00
  Downloading google_api_core-2.11.1-py3-none-any.whl (120 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 120.5/120.5 kB 17.2 MB/s eta 0:00:00
INFO: This is taking longer than usual. You might need to provide the dependency resolver with stricter constraints to reduce runtime. See https://pip.pypa.io/warnings/backtracking for guidance. If you want to abort this run, press Ctrl + C.
  Downloading google_api_core-2.11.0-py3-none-any.whl (120 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 120.3/120.3 kB 17.0 MB/s eta 0:00:00
  Downloading google_api_core-1.34.1-py3-none-any.whl (120 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 120.4/120.4 kB 17.7 MB/s eta 0:00:00
Collecting protobuf>=3.8.0
  Downloading protobuf-3.20.3-cp37-cp37m-manylinux_2_5_x86_64.manylinux1_x86_64.whl (1.0 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.0/1.0 MB 54.7 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of etils[enp,epath] to determine which version is compatible with other requirements. This could take a while.
INFO: pip is looking at multiple versions of click to determine which version is compatible with other requirements. This could take a while.
Collecting click
  Downloading click-8.1.6-py3-none-any.whl (97 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 97.9/97.9 kB 13.8 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of astor to determine which version is compatible with other requirements. This could take a while.
Collecting astor>=0.6.0
  Downloading astor-0.8.0-py2.py3-none-any.whl (27 kB)
INFO: pip is looking at multiple versions of absl-py to determine which version is compatible with other requirements. This could take a while.
Collecting absl-py>=0.7.0
  Downloading absl_py-2.0.0-py3-none-any.whl (130 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 130.2/130.2 kB 19.9 MB/s eta 0:00:00
INFO: pip is looking at multiple versions of google-cloud-logging to determine which version is compatible with other requirements. This could take a while.
Collecting google-cloud-logging
  Downloading google_cloud_logging-3.9.0-py2.py3-none-any.whl (207 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 207.3/207.3 kB 25.5 MB/s eta 0:00:00
Collecting google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,<3.0.0dev,>=1.33.2
  Downloading google_api_core-2.10.2-py3-none-any.whl (115 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 115.6/115.6 kB 18.0 MB/s eta 0:00:00
Collecting google-auth<3.0dev,>=1.25.0
  Downloading google_auth-1.35.0-py2.py3-none-any.whl (152 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 152.9/152.9 kB 21.7 MB/s eta 0:00:00
Collecting cachetools<5.0,>=2.0.0
  Downloading cachetools-4.2.4-py3-none-any.whl (10 kB)
Collecting google-cloud-appengine-logging<2.0.0dev,>=0.1.0
  Downloading google_cloud_appengine_logging-1.3.1-py2.py3-none-any.whl (16 kB)
  Downloading google_cloud_appengine_logging-1.3.0-py2.py3-none-any.whl (15 kB)
  Downloading google_cloud_appengine_logging-1.2.0-py2.py3-none-any.whl (15 kB)
  Downloading google_cloud_appengine_logging-1.1.6-py2.py3-none-any.whl (14 kB)
Collecting absl-py>=0.7.0
  Downloading absl_py-1.4.0-py3-none-any.whl (126 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 126.5/126.5 kB 17.6 MB/s eta 0:00:00
Collecting requests-oauthlib>=0.7.0
  Downloading requests_oauthlib-2.0.0-py2.py3-none-any.whl (24 kB)
Collecting grpcio-status<2.0dev,>=1.33.2
  Downloading grpcio_status-1.62.1-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.62.0-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.60.1-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.60.0-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.59.3-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.59.2-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.59.0-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.58.0-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.57.0-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.56.2-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.56.0-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.55.3-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.54.3-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.54.2-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.54.0-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.53.2-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.53.1-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.53.0-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.51.3-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.51.1-py3-none-any.whl (5.1 kB)
  Downloading grpcio_status-1.50.0-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.49.1-py3-none-any.whl (14 kB)
  Downloading grpcio_status-1.48.2-py3-none-any.whl (14 kB)
Collecting pyasn1<0.6.0,>=0.4.6
  Downloading pyasn1-0.5.1-py2.py3-none-any.whl (84 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 84.9/84.9 kB 15.1 MB/s eta 0:00:00
Collecting oauthlib>=3.0.0
  Downloading oauthlib-3.2.2-py3-none-any.whl (151 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 151.7/151.7 kB 23.5 MB/s eta 0:00:00
Building wheels for collected packages: gast, healthcheck, promise
  Building wheel for gast (setup.py): started
  Building wheel for gast (setup.py): finished with status 'done'
  Created wheel for gast: filename=gast-0.2.2-py3-none-any.whl size=7554 sha256=3dadd4672bf82e979b61ab8c8f13027ca0950381f99ac93af2faa70a33cc5a41
  Stored in directory: /root/.cache/pip/wheels/21/7f/02/420f32a803f7d0967b48dd823da3f558c5166991bfd204eef3
  Building wheel for healthcheck (setup.py): started
  Building wheel for healthcheck (setup.py): finished with status 'done'
  Created wheel for healthcheck: filename=healthcheck-1.3.3-py3-none-any.whl size=4336 sha256=f5fc0093f6a75683a428af2bd7dfd20107019887111ba52ca85681db6ddcec8d
  Stored in directory: /root/.cache/pip/wheels/b2/8f/c8/0a614b50d7033f9c97e919967f9afb7a6b6b61d5848c0a9c6a
  Building wheel for promise (setup.py): started
  Building wheel for promise (setup.py): finished with status 'done'
  Created wheel for promise: filename=promise-2.3-py3-none-any.whl size=21501 sha256=d866b8abbf22d8db4c04ad9ecd414745d11bc91db7d0f8b5971af7ec4390267b
  Stored in directory: /root/.cache/pip/wheels/29/93/c6/762e359f8cb6a5b69c72235d798804cae523bbe41c2aa8333d
Successfully built gast healthcheck promise
Installing collected packages: tensorflow-estimator, healthcheck, dm-tree, zipp, wrapt, urllib3, typing-extensions, tqdm, toml, termcolor, six, pyasn1, psutil, protobuf, packaging, oauthlib, numpy, MarkupSafe, itsdangerous, idna, grpcio, gast, etils, dill, charset-normalizer, certifi, cachetools, astor, absl-py, Werkzeug, scipy, rsa, requests, pyasn1-modules, proto-plus, promise, opt-einsum, keras-preprocessing, Jinja2, importlib-resources, importlib-metadata, h5py, googleapis-common-protos, google-pasta, tensorflow-metadata, requests-oauthlib, markdown, keras-applications, gunicorn, grpcio-status, google-cloud-audit-log, google-auth, click, tensorflow-datasets, grpc-google-iam-v1, google-auth-oauthlib, google-api-core, Flask, tensorboard, google-cloud-core, tensorflow, google-cloud-appengine-logging, google-cloud-logging
Successfully installed Flask-2.2.5 Jinja2-3.1.4 MarkupSafe-2.1.5 Werkzeug-2.2.3 absl-py-1.4.0 astor-0.8.1 cachetools-4.2.4 certifi-2024.6.2 charset-normalizer-3.3.2 click-8.1.7 dill-0.3.7 dm-tree-0.1.8 etils-0.9.0 gast-0.2.2 google-api-core-2.10.2 google-auth-1.35.0 google-auth-oauthlib-0.4.6 google-cloud-appengine-logging-1.1.6 google-cloud-audit-log-0.2.5 google-cloud-core-2.4.1 google-cloud-logging-3.9.0 google-pasta-0.2.0 googleapis-common-protos-1.63.1 grpc-google-iam-v1-0.13.0 grpcio-1.62.2 grpcio-status-1.48.2 gunicorn-22.0.0 h5py-3.8.0 healthcheck-1.3.3 idna-3.7 importlib-metadata-6.7.0 importlib-resources-5.12.0 itsdangerous-2.1.2 keras-applications-1.0.8 keras-preprocessing-1.1.2 markdown-3.4.4 numpy-1.21.6 oauthlib-3.2.2 opt-einsum-3.3.0 packaging-24.0 promise-2.3 proto-plus-1.23.0 protobuf-3.20.3 psutil-6.0.0 pyasn1-0.5.1 pyasn1-modules-0.3.0 requests-2.31.0 requests-oauthlib-2.0.0 rsa-4.9 scipy-1.4.1 six-1.16.0 tensorboard-2.1.1 tensorflow-2.1.0 tensorflow-datasets-4.8.2 tensorflow-estimator-2.1.0 tensorflow-metadata-1.12.0 termcolor-2.3.0 toml-0.10.2 tqdm-4.66.4 typing-extensions-4.7.1 urllib3-2.0.7 wrapt-1.16.0 zipp-3.15.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[notice] A new release of pip is available: 23.0.1 -> 24.0
[notice] To update, run: pip install --upgrade pip
Removing intermediate container 444dff1aa238
 34fd00c22357
Step 6/6 : CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 SAGunicorns:app
 Running in 740b055410fe
Removing intermediate container 740b055410fe
 f750194148ac
Successfully built f750194148ac
Successfully tagged gcr.io/shuchi-project/saflask-gke:latest
PUSH
Pushing gcr.io/shuchi-project/saflask-gke
The push refers to repository [gcr.io/shuchi-project/saflask-gke]
9196781fcb3b: Preparing
acfb57e50cc2: Preparing
84c0fadb56b4: Preparing
b8594deafbe5: Preparing
8a55150afecc: Preparing
ad34ffec41dd: Preparing
f19cb1e4112d: Preparing
d310e774110a: Preparing
ad34ffec41dd: Waiting
f19cb1e4112d: Waiting
d310e774110a: Waiting
8a55150afecc: Layer already exists
b8594deafbe5: Layer already exists
ad34ffec41dd: Layer already exists
f19cb1e4112d: Layer already exists
d310e774110a: Layer already exists
84c0fadb56b4: Pushed
acfb57e50cc2: Pushed
9196781fcb3b: Pushed
latest: digest: sha256:0c47a3e682fa9a1bdbb85625747d28294e2c0f25e8f2f1704bf083f1a0d8cee4 size: 2003
DONE
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ID: f261544f-089b-4983-b458-04d8c7e1e4c3
CREATE_TIME: 2024-06-18T22:44:54+00:00
DURATION: 13M31S
SOURCE: gs://shuchi-project_cloudbuild/source/1718750681.519636-667a66ecca4d49d79295b0b78e97c6af.tgz
IMAGES: gcr.io/shuchi-project/saflask-gke (+1 more)
STATUS: SUCCESS

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud builds list
ID: f261544f-089b-4983-b458-04d8c7e1e4c3
CREATE_TIME: 2024-06-18T22:44:54+00:00
DURATION: 13M31S
SOURCE: gs://shuchi-project_cloudbuild/source/1718750681.519636-667a66ecca4d49d79295b0b78e97c6af.tgz
IMAGES: gcr.io/shuchi-project/saflask-gke (+1 more)
STATUS: SUCCESS


shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud config list
[accessibility]
screen_reader = True
[component_manager]
disable_update_check = True
[compute]
gce_metadata_read_timeout_sec = 30
[core]
account = shuchimishra.ucla@gmail.com
disable_usage_reporting = True
project = shuchi-project
[metrics]
environment = devshell

Your active configuration is: [cloudshell-11099]
shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud init
Welcome! This command will take you through the configuration of gcloud.

Settings from your current configuration [cloudshell-11099] are:
accessibility:
  screen_reader: 'True'
component_manager:
  disable_update_check: 'True'
compute:
  gce_metadata_read_timeout_sec: '30'
core:
  account: shuchimishra.ucla@gmail.com
  disable_usage_reporting: 'True'
  project: shuchi-project
metrics:
  environment: devshell

Pick configuration to use:
 [1] Re-initialize this configuration [cloudshell-11099] with new settings 
 [2] Create a new configuration
Please enter your numeric choice:  1

Your current configuration has been set to: [cloudshell-11099]

You can skip diagnostics next time by using the following flag:
  gcloud init --skip-diagnostics

Network diagnostic detects and fixes local network connection issues.
Checking network connection...done.                                                                                                                                                                                                               
Reachability Check passed.
Network diagnostic passed (1/1 checks passed).

Choose the account you would like to use to perform operations for this configuration:
 [1] shuchimishra.ucla@gmail.com
 [2] Log in with a new account
Please enter your numeric choice:  1

You are logged in as: [shuchimishra.ucla@gmail.com].

Pick cloud project to use: 
 [1] distributed-amp-426821-b3
 [2] shuchi-project
 [3] Enter a project ID
 [4] Create a new project
Please enter numeric choice or text value (must exactly match list item):  2

Your current project has been set to: [shuchi-project].

Do you want to configure a default Compute Region and Zone? (Y/n)?  Y

Which Google Compute Engine zone would you like to use as project default?
If you do not specify a zone via a command line flag while working with Compute Engine resources, the default is assumed.
 [1] us-east1-b
 [2] us-east1-c
 [3] us-east1-d
 [4] us-east4-c
 [5] us-east4-b
 [6] us-east4-a
 [7] us-central1-c
 [8] us-central1-a
 [9] us-central1-f
 [10] us-central1-b
 [11] us-west1-b
 [12] us-west1-c
 [13] us-west1-a
 [14] europe-west4-a
 [15] europe-west4-b
 [16] europe-west4-c
 [17] europe-west1-b
 [18] europe-west1-d
 [19] europe-west1-c
 [20] europe-west3-c
 [21] europe-west3-a
 [22] europe-west3-b
 [23] europe-west2-c
 [24] europe-west2-b
 [25] europe-west2-a
 [26] asia-east1-b
 [27] asia-east1-a
 [28] asia-east1-c
 [29] asia-southeast1-b
 [30] asia-southeast1-a
 [31] asia-southeast1-c
 [32] asia-northeast1-b
 [33] asia-northeast1-c
 [34] asia-northeast1-a
 [35] asia-south1-c
 [36] asia-south1-b
 [37] asia-south1-a
 [38] australia-southeast1-b
 [39] australia-southeast1-c
 [40] australia-southeast1-a
 [41] southamerica-east1-b
 [42] southamerica-east1-c
 [43] southamerica-east1-a
 [44] africa-south1-a
 [45] africa-south1-b
 [46] africa-south1-c
 [47] asia-east2-a
 [48] asia-east2-b
 [49] asia-east2-c
 [50] asia-northeast2-a
Did not print [72] options.
Too many options [122]. Enter "list" at prompt to print choices fully.
Please enter numeric choice or text value (must exactly match list item):  11

Your project default Compute Engine zone has been set to [us-west1-b].
You can change it by running [gcloud config set compute/zone NAME].

Your project default Compute Engine region has been set to [us-west1].
You can change it by running [gcloud config set compute/region NAME].

Created a default .boto configuration file at [/home/shuchimishra_ucla/.boto]. See this file and
[https://cloud.google.com/storage/docs/gsutil/commands/config] for more
information about configuring Google Cloud Storage.
Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use shuchimishra.ucla@gmail.com by default
* Commands will reference project `shuchi-project` by default
* Compute Engine commands will use region `us-west1` by default
* Compute Engine commands will use zone `us-west1-b` by default

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud container clusters create flaskapp-gke --num-nodes 1 --issue-client-certificate --scopes=https://www.googleapis.com/auth/logging.write --region=us-west1                      
Default change: VPC-native is the default mode during cluster creation for versions greater than 1.21.0-gke.1500. To create advanced routes based clusters, please pass the `--no-enable-ip-alias` flag
Note: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).
Creating cluster flaskapp-gke in us-west1... Cluster is being health-checked (master is healthy)...done.                                                                                                                                          
Created [https://container.googleapis.com/v1/projects/shuchi-project/zones/us-west1/clusters/flaskapp-gke].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-west1/flaskapp-gke?project=shuchi-project
kubeconfig entry generated for flaskapp-gke.
NAME: flaskapp-gke
LOCATION: us-west1
MASTER_VERSION: 1.29.4-gke.1043002
MASTER_IP: 35.230.49.159
MACHINE_TYPE: e2-medium
NODE_VERSION: 1.29.4-gke.1043002
NUM_NODES: 3
STATUS: RUNNING


