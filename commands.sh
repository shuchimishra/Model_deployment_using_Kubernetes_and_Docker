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

Creating temporary archive of 10 file(s) totalling 113.7 MiB before compression.
Uploading tarball of [.] to [gs://shuchi-project_cloudbuild/source/1718839276.467422-91c1da40bbce44779bfe655bff8a1ed0.tgz]
Created [https://cloudbuild.googleapis.com/v1/projects/shuchi-project/locations/global/builds/afc4f061-816a-41e4-afd5-8c5e13b75be7].
Logs are available at [ https://console.cloud.google.com/cloud-build/builds/afc4f061-816a-41e4-afd5-8c5e13b75be7?project=338441565703 ].
Waiting for build to complete. Polling interval: 1 second(s).
--------------------------------------------------------------------------------------------------------------- REMOTE BUILD OUTPUT ---------------------------------------------------------------------------------------------------------------
starting build "afc4f061-816a-41e4-afd5-8c5e13b75be7"

FETCHSOURCE
Fetching storage object: gs://shuchi-project_cloudbuild/source/1718839276.467422-91c1da40bbce44779bfe655bff8a1ed0.tgz#1718839290231537
Copying gs://shuchi-project_cloudbuild/source/1718839276.467422-91c1da40bbce44779bfe655bff8a1ed0.tgz#1718839290231537...
\ [1 files][ 88.3 MiB/ 88.3 MiB]                                                
Operation completed over 1 objects/88.3 MiB.
BUILD
Already have image (with digest): gcr.io/cloud-builders/docker
Sending build context to Docker daemon  119.2MB
Step 1/7 : FROM python:3.7-slim
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
8973eb85275f: Verifying Checksum
8973eb85275f: Download complete
f9afc3cc0135: Verifying Checksum
f9afc3cc0135: Download complete
39312d8b4ab7: Verifying Checksum
39312d8b4ab7: Download complete
a803e7c4b030: Verifying Checksum
a803e7c4b030: Download complete
a803e7c4b030: Pull complete
bf3336e84c8e: Pull complete
8973eb85275f: Pull complete
f9afc3cc0135: Pull complete
39312d8b4ab7: Pull complete
Digest: sha256:b53f496ca43e5af6994f8e316cf03af31050bf7944e0e4a308ad86c001cf028b
Status: Downloaded newer image for python:3.7-slim
 a255ffcb469f
Step 2/7 : ENV APP_HOME /app
 Running in c754ff60cb4f
Removing intermediate container c754ff60cb4f
 fabdf684b58c
Step 3/7 : WORKDIR $APP_HOME
 Running in 570a9ed32491
Removing intermediate container 570a9ed32491
 58deb22a8656
Step 4/7 : COPY . ./
 ec2660b3deca
Step 5/7 : RUN pip install --upgrade pip
 Running in 0f9971557218
Requirement already satisfied: pip in /usr/local/lib/python3.7/site-packages (23.0.1)
Collecting pip
  Downloading pip-24.0-py3-none-any.whl (2.1 MB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.1/2.1 MB 10.9 MB/s eta 0:00:00
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 23.0.1
    Uninstalling pip-23.0.1:
      Successfully uninstalled pip-23.0.1
Successfully installed pip-24.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Removing intermediate container 0f9971557218
 b798d12dfa2d
Step 6/7 : RUN pip install tensorflow==2.11.0 tensorflow-datasets Flask gunicorn healthcheck google-cloud-logging
 Running in 17ca69562711
Collecting tensorflow==2.11.0
  Downloading tensorflow-2.11.0-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (3.1 kB)
Collecting tensorflow-datasets
  Downloading tensorflow_datasets-4.8.2-py3-none-any.whl.metadata (7.0 kB)
Collecting Flask
  Downloading Flask-2.2.5-py3-none-any.whl.metadata (3.9 kB)
Collecting gunicorn
  Downloading gunicorn-22.0.0-py3-none-any.whl.metadata (4.4 kB)
Collecting healthcheck
  Downloading healthcheck-1.3.3.tar.gz (5.6 kB)
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Collecting google-cloud-logging
  Downloading google_cloud_logging-3.10.0-py2.py3-none-any.whl.metadata (4.9 kB)
Collecting absl-py>=1.0.0 (from tensorflow==2.11.0)
  Downloading absl_py-2.1.0-py3-none-any.whl.metadata (2.3 kB)
Collecting astunparse>=1.6.0 (from tensorflow==2.11.0)
  Downloading astunparse-1.6.3-py2.py3-none-any.whl.metadata (4.4 kB)
Collecting flatbuffers>=2.0 (from tensorflow==2.11.0)
  Downloading flatbuffers-24.3.25-py2.py3-none-any.whl.metadata (850 bytes)
Collecting gast<=0.4.0,>=0.2.1 (from tensorflow==2.11.0)
  Downloading gast-0.4.0-py3-none-any.whl.metadata (1.1 kB)
Collecting google-pasta>=0.1.1 (from tensorflow==2.11.0)
  Downloading google_pasta-0.2.0-py3-none-any.whl.metadata (814 bytes)
Collecting grpcio<2.0,>=1.24.3 (from tensorflow==2.11.0)
  Downloading grpcio-1.62.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (4.0 kB)
Collecting h5py>=2.9.0 (from tensorflow==2.11.0)
  Downloading h5py-3.8.0-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (2.5 kB)
Collecting keras<2.12,>=2.11.0 (from tensorflow==2.11.0)
  Downloading keras-2.11.0-py2.py3-none-any.whl.metadata (1.4 kB)
Collecting libclang>=13.0.0 (from tensorflow==2.11.0)
  Downloading libclang-18.1.1-py2.py3-none-manylinux2010_x86_64.whl.metadata (5.2 kB)
Collecting numpy>=1.20 (from tensorflow==2.11.0)
  Downloading numpy-1.21.6-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl.metadata (2.1 kB)
Collecting opt-einsum>=2.3.2 (from tensorflow==2.11.0)
  Downloading opt_einsum-3.3.0-py3-none-any.whl.metadata (6.5 kB)
Collecting packaging (from tensorflow==2.11.0)
  Downloading packaging-24.0-py3-none-any.whl.metadata (3.2 kB)
Collecting protobuf<3.20,>=3.9.2 (from tensorflow==2.11.0)
  Downloading protobuf-3.19.6-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (787 bytes)
Requirement already satisfied: setuptools in /usr/local/lib/python3.7/site-packages (from tensorflow==2.11.0) (57.5.0)
Collecting six>=1.12.0 (from tensorflow==2.11.0)
  Downloading six-1.16.0-py2.py3-none-any.whl.metadata (1.8 kB)
Collecting tensorboard<2.12,>=2.11 (from tensorflow==2.11.0)
  Downloading tensorboard-2.11.2-py3-none-any.whl.metadata (1.9 kB)
Collecting tensorflow-estimator<2.12,>=2.11.0 (from tensorflow==2.11.0)
  Downloading tensorflow_estimator-2.11.0-py2.py3-none-any.whl.metadata (1.3 kB)
Collecting termcolor>=1.1.0 (from tensorflow==2.11.0)
  Downloading termcolor-2.3.0-py3-none-any.whl.metadata (5.3 kB)
Collecting typing-extensions>=3.6.6 (from tensorflow==2.11.0)
  Downloading typing_extensions-4.7.1-py3-none-any.whl.metadata (3.1 kB)
Collecting wrapt>=1.11.0 (from tensorflow==2.11.0)
  Downloading wrapt-1.16.0-cp37-cp37m-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (6.6 kB)
Collecting tensorflow-io-gcs-filesystem>=0.23.1 (from tensorflow==2.11.0)
  Downloading tensorflow_io_gcs_filesystem-0.34.0-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl.metadata (14 kB)
Collecting click (from tensorflow-datasets)
  Downloading click-8.1.7-py3-none-any.whl.metadata (3.0 kB)
Collecting dill (from tensorflow-datasets)
  Downloading dill-0.3.7-py3-none-any.whl.metadata (9.9 kB)
Collecting dm-tree (from tensorflow-datasets)
  Downloading dm_tree-0.1.8-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (1.9 kB)
Collecting etils>=0.9.0 (from etils[enp,epath]>=0.9.0->tensorflow-datasets)
  Downloading etils-0.9.0-py3-none-any.whl.metadata (5.4 kB)
Collecting promise (from tensorflow-datasets)
  Downloading promise-2.3.tar.gz (19 kB)
  Preparing metadata (setup.py): started
  Preparing metadata (setup.py): finished with status 'done'
Collecting psutil (from tensorflow-datasets)
  Downloading psutil-6.0.0-cp36-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (21 kB)
Collecting requests>=2.19.0 (from tensorflow-datasets)
  Downloading requests-2.31.0-py3-none-any.whl.metadata (4.6 kB)
Collecting tensorflow-metadata (from tensorflow-datasets)
  Downloading tensorflow_metadata-1.12.0-py3-none-any.whl.metadata (2.2 kB)
Collecting toml (from tensorflow-datasets)
  Downloading toml-0.10.2-py2.py3-none-any.whl.metadata (7.1 kB)
Collecting tqdm (from tensorflow-datasets)
  Downloading tqdm-4.66.4-py3-none-any.whl.metadata (57 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.6/57.6 kB 1.1 MB/s eta 0:00:00
Collecting importlib-resources (from tensorflow-datasets)
  Downloading importlib_resources-5.12.0-py3-none-any.whl.metadata (4.1 kB)
Collecting Werkzeug>=2.2.2 (from Flask)
  Downloading Werkzeug-2.2.3-py3-none-any.whl.metadata (4.4 kB)
Collecting Jinja2>=3.0 (from Flask)
  Downloading jinja2-3.1.4-py3-none-any.whl.metadata (2.6 kB)
Collecting itsdangerous>=2.0 (from Flask)
  Downloading itsdangerous-2.1.2-py3-none-any.whl.metadata (2.9 kB)
Collecting importlib-metadata>=3.6.0 (from Flask)
  Downloading importlib_metadata-6.7.0-py3-none-any.whl.metadata (4.9 kB)
Collecting google-api-core!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1 (from google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1->google-cloud-logging)
  Downloading google_api_core-2.19.0-py3-none-any.whl.metadata (2.7 kB)
Collecting google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1 (from google-cloud-logging)
  Downloading google_auth-2.30.0-py2.py3-none-any.whl.metadata (4.7 kB)
Collecting google-cloud-appengine-logging<2.0.0dev,>=0.1.0 (from google-cloud-logging)
  Downloading google_cloud_appengine_logging-1.4.3-py2.py3-none-any.whl.metadata (5.4 kB)
Collecting google-cloud-audit-log<1.0.0dev,>=0.1.0 (from google-cloud-logging)
  Downloading google_cloud_audit_log-0.2.5-py2.py3-none-any.whl.metadata (1.4 kB)
Collecting google-cloud-core<3.0.0dev,>=2.0.0 (from google-cloud-logging)
  Downloading google_cloud_core-2.4.1-py2.py3-none-any.whl.metadata (2.7 kB)
Collecting grpc-google-iam-v1<1.0.0dev,>=0.12.4 (from google-cloud-logging)
  Downloading grpc_google_iam_v1-0.13.0-py2.py3-none-any.whl.metadata (3.3 kB)
Collecting proto-plus<2.0.0dev,>=1.22.0 (from google-cloud-logging)
  Downloading proto_plus-1.24.0-py3-none-any.whl.metadata (2.2 kB)
Requirement already satisfied: wheel<1.0,>=0.23.0 in /usr/local/lib/python3.7/site-packages (from astunparse>=1.6.0->tensorflow==2.11.0) (0.41.2)
Collecting zipp (from etils[enp,epath]>=0.9.0->tensorflow-datasets)
  Downloading zipp-3.15.0-py3-none-any.whl.metadata (3.7 kB)
Collecting googleapis-common-protos<2.0.dev0,>=1.56.2 (from google-api-core!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1->google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1->google-cloud-logging)
  Downloading googleapis_common_protos-1.63.1-py2.py3-none-any.whl.metadata (1.5 kB)
Collecting grpcio-status<2.0.dev0,>=1.33.2 (from google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1->google-cloud-logging)
  Downloading grpcio_status-1.62.2-py3-none-any.whl.metadata (1.3 kB)
Collecting cachetools<6.0,>=2.0.0 (from google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1->google-cloud-logging)
  Downloading cachetools-5.3.3-py3-none-any.whl.metadata (5.3 kB)
Collecting pyasn1-modules>=0.2.1 (from google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1->google-cloud-logging)
  Downloading pyasn1_modules-0.3.0-py2.py3-none-any.whl.metadata (3.6 kB)
Collecting rsa<5,>=3.1.4 (from google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1->google-cloud-logging)
  Downloading rsa-4.9-py3-none-any.whl.metadata (4.2 kB)
Collecting MarkupSafe>=2.0 (from Jinja2>=3.0->Flask)
  Downloading MarkupSafe-2.1.5-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (3.0 kB)
Collecting charset-normalizer<4,>=2 (from requests>=2.19.0->tensorflow-datasets)
  Downloading charset_normalizer-3.3.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl.metadata (33 kB)
Collecting idna<4,>=2.5 (from requests>=2.19.0->tensorflow-datasets)
  Downloading idna-3.7-py3-none-any.whl.metadata (9.9 kB)
Collecting urllib3<3,>=1.21.1 (from requests>=2.19.0->tensorflow-datasets)
  Downloading urllib3-2.0.7-py3-none-any.whl.metadata (6.6 kB)
Collecting certifi>=2017.4.17 (from requests>=2.19.0->tensorflow-datasets)
  Downloading certifi-2024.6.2-py3-none-any.whl.metadata (2.2 kB)
Collecting google-auth-oauthlib<0.5,>=0.4.1 (from tensorboard<2.12,>=2.11->tensorflow==2.11.0)
  Downloading google_auth_oauthlib-0.4.6-py2.py3-none-any.whl.metadata (2.7 kB)
Collecting markdown>=2.6.8 (from tensorboard<2.12,>=2.11->tensorflow==2.11.0)
  Downloading Markdown-3.4.4-py3-none-any.whl.metadata (6.9 kB)
Collecting tensorboard-data-server<0.7.0,>=0.6.0 (from tensorboard<2.12,>=2.11->tensorflow==2.11.0)
  Downloading tensorboard_data_server-0.6.1-py3-none-manylinux2010_x86_64.whl.metadata (1.1 kB)
Collecting tensorboard-plugin-wit>=1.6.0 (from tensorboard<2.12,>=2.11->tensorflow==2.11.0)
  Downloading tensorboard_plugin_wit-1.8.1-py3-none-any.whl.metadata (873 bytes)
Collecting absl-py>=1.0.0 (from tensorflow==2.11.0)
  Downloading absl_py-1.4.0-py3-none-any.whl.metadata (2.3 kB)
Collecting requests-oauthlib>=0.7.0 (from google-auth-oauthlib<0.5,>=0.4.1->tensorboard<2.12,>=2.11->tensorflow==2.11.0)
  Downloading requests_oauthlib-2.0.0-py2.py3-none-any.whl.metadata (11 kB)
INFO: pip is looking at multiple versions of grpcio-status to determine which version is compatible with other requirements. This could take a while.
Collecting grpcio-status<2.0.dev0,>=1.33.2 (from google-api-core[grpc]!=2.0.*,!=2.1.*,!=2.10.*,!=2.2.*,!=2.3.*,!=2.4.*,!=2.5.*,!=2.6.*,!=2.7.*,!=2.8.*,!=2.9.*,<3.0.0dev,>=1.34.1->google-cloud-logging)
  Downloading grpcio_status-1.62.1-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.62.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.60.1-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.60.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.59.3-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.59.2-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.59.0-py3-none-any.whl.metadata (1.3 kB)
INFO: pip is still looking at multiple versions of grpcio-status to determine which version is compatible with other requirements. This could take a while.
  Downloading grpcio_status-1.58.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.57.0-py3-none-any.whl.metadata (1.2 kB)
  Downloading grpcio_status-1.56.2-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.56.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.55.3-py3-none-any.whl.metadata (1.3 kB)
INFO: This is taking longer than usual. You might need to provide the dependency resolver with stricter constraints to reduce runtime. See https://pip.pypa.io/warnings/backtracking for guidance. If you want to abort this run, press Ctrl + C.
  Downloading grpcio_status-1.54.3-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.54.2-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.54.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.53.2-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.53.1-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.53.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.51.3-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.51.1-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.50.0-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.49.1-py3-none-any.whl.metadata (1.3 kB)
  Downloading grpcio_status-1.48.2-py3-none-any.whl.metadata (1.2 kB)
Collecting pyasn1<0.6.0,>=0.4.6 (from pyasn1-modules>=0.2.1->google-auth!=2.24.0,!=2.25.0,<3.0.0dev,>=2.14.1->google-cloud-logging)
  Downloading pyasn1-0.5.1-py2.py3-none-any.whl.metadata (8.6 kB)
Collecting oauthlib>=3.0.0 (from requests-oauthlib>=0.7.0->google-auth-oauthlib<0.5,>=0.4.1->tensorboard<2.12,>=2.11->tensorflow==2.11.0)
  Downloading oauthlib-3.2.2-py3-none-any.whl.metadata (7.5 kB)
Downloading tensorflow-2.11.0-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (588.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 588.3/588.3 MB 2.1 MB/s eta 0:00:00
Downloading tensorflow_datasets-4.8.2-py3-none-any.whl (5.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.3/5.3 MB 57.2 MB/s eta 0:00:00
Downloading Flask-2.2.5-py3-none-any.whl (101 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 101.8/101.8 kB 10.3 MB/s eta 0:00:00
Downloading gunicorn-22.0.0-py3-none-any.whl (84 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 84.4/84.4 kB 8.4 MB/s eta 0:00:00
Downloading google_cloud_logging-3.10.0-py2.py3-none-any.whl (213 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 213.4/213.4 kB 19.2 MB/s eta 0:00:00
Downloading astunparse-1.6.3-py2.py3-none-any.whl (12 kB)
Downloading click-8.1.7-py3-none-any.whl (97 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 97.9/97.9 kB 9.0 MB/s eta 0:00:00
Downloading etils-0.9.0-py3-none-any.whl (140 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 140.1/140.1 kB 13.0 MB/s eta 0:00:00
Downloading flatbuffers-24.3.25-py2.py3-none-any.whl (26 kB)
Downloading gast-0.4.0-py3-none-any.whl (9.8 kB)
Downloading google_api_core-2.19.0-py3-none-any.whl (139 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 139.0/139.0 kB 14.5 MB/s eta 0:00:00
Downloading google_auth-2.30.0-py2.py3-none-any.whl (193 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 193.7/193.7 kB 18.6 MB/s eta 0:00:00
Downloading google_cloud_appengine_logging-1.4.3-py2.py3-none-any.whl (15 kB)
Downloading google_cloud_audit_log-0.2.5-py2.py3-none-any.whl (12 kB)
Downloading google_cloud_core-2.4.1-py2.py3-none-any.whl (29 kB)
Downloading google_pasta-0.2.0-py3-none-any.whl (57 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 57.5/57.5 kB 5.9 MB/s eta 0:00:00
Downloading grpc_google_iam_v1-0.13.0-py2.py3-none-any.whl (25 kB)
Downloading grpcio-1.62.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (5.6 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 5.6/5.6 MB 62.0 MB/s eta 0:00:00
Downloading h5py-3.8.0-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (4.3 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.3/4.3 MB 61.2 MB/s eta 0:00:00
Downloading importlib_metadata-6.7.0-py3-none-any.whl (22 kB)
Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Downloading jinja2-3.1.4-py3-none-any.whl (133 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.3/133.3 kB 13.2 MB/s eta 0:00:00
Downloading keras-2.11.0-py2.py3-none-any.whl (1.7 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.7/1.7 MB 60.1 MB/s eta 0:00:00
Downloading libclang-18.1.1-py2.py3-none-manylinux2010_x86_64.whl (24.5 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 24.5/24.5 MB 46.0 MB/s eta 0:00:00
Downloading numpy-1.21.6-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.7 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 15.7/15.7 MB 50.4 MB/s eta 0:00:00
Downloading opt_einsum-3.3.0-py3-none-any.whl (65 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 65.5/65.5 kB 5.5 MB/s eta 0:00:00
Downloading proto_plus-1.24.0-py3-none-any.whl (50 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 50.1/50.1 kB 4.6 MB/s eta 0:00:00
Downloading protobuf-3.19.6-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (1.1 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 1.1/1.1 MB 48.0 MB/s eta 0:00:00
Downloading requests-2.31.0-py3-none-any.whl (62 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 62.6/62.6 kB 5.0 MB/s eta 0:00:00
Downloading six-1.16.0-py2.py3-none-any.whl (11 kB)
Downloading tensorboard-2.11.2-py3-none-any.whl (6.0 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 6.0/6.0 MB 62.6 MB/s eta 0:00:00
Downloading tensorflow_estimator-2.11.0-py2.py3-none-any.whl (439 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 439.2/439.2 kB 24.0 MB/s eta 0:00:00
Downloading tensorflow_io_gcs_filesystem-0.34.0-cp37-cp37m-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (2.4 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 2.4/2.4 MB 64.2 MB/s eta 0:00:00
Downloading termcolor-2.3.0-py3-none-any.whl (6.9 kB)
Downloading typing_extensions-4.7.1-py3-none-any.whl (33 kB)
Downloading Werkzeug-2.2.3-py3-none-any.whl (233 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 233.6/233.6 kB 21.9 MB/s eta 0:00:00
Downloading wrapt-1.16.0-cp37-cp37m-manylinux_2_5_x86_64.manylinux1_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (77 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 77.5/77.5 kB 8.9 MB/s eta 0:00:00
Downloading dill-0.3.7-py3-none-any.whl (115 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 115.3/115.3 kB 12.5 MB/s eta 0:00:00
Downloading dm_tree-0.1.8-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (153 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 153.8/153.8 kB 15.5 MB/s eta 0:00:00
Downloading importlib_resources-5.12.0-py3-none-any.whl (36 kB)
Downloading packaging-24.0-py3-none-any.whl (53 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 53.5/53.5 kB 4.4 MB/s eta 0:00:00
Downloading psutil-6.0.0-cp36-abi3-manylinux_2_12_x86_64.manylinux2010_x86_64.manylinux_2_17_x86_64.manylinux2014_x86_64.whl (290 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 290.5/290.5 kB 26.2 MB/s eta 0:00:00
Downloading tensorflow_metadata-1.12.0-py3-none-any.whl (52 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 52.3/52.3 kB 5.5 MB/s eta 0:00:00
Downloading absl_py-1.4.0-py3-none-any.whl (126 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 126.5/126.5 kB 12.8 MB/s eta 0:00:00
Downloading toml-0.10.2-py2.py3-none-any.whl (16 kB)
Downloading tqdm-4.66.4-py3-none-any.whl (78 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 78.3/78.3 kB 7.8 MB/s eta 0:00:00
Downloading cachetools-5.3.3-py3-none-any.whl (9.3 kB)
Downloading certifi-2024.6.2-py3-none-any.whl (164 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 164.4/164.4 kB 15.5 MB/s eta 0:00:00
Downloading charset_normalizer-3.3.2-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (136 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 136.8/136.8 kB 13.0 MB/s eta 0:00:00
Downloading google_auth_oauthlib-0.4.6-py2.py3-none-any.whl (18 kB)
Downloading googleapis_common_protos-1.63.1-py2.py3-none-any.whl (229 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 229.2/229.2 kB 21.1 MB/s eta 0:00:00
Downloading grpcio_status-1.48.2-py3-none-any.whl (14 kB)
Downloading idna-3.7-py3-none-any.whl (66 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 66.8/66.8 kB 7.0 MB/s eta 0:00:00
Downloading Markdown-3.4.4-py3-none-any.whl (94 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 94.2/94.2 kB 8.8 MB/s eta 0:00:00
Downloading MarkupSafe-2.1.5-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Downloading pyasn1_modules-0.3.0-py2.py3-none-any.whl (181 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 181.3/181.3 kB 16.2 MB/s eta 0:00:00
Downloading rsa-4.9-py3-none-any.whl (34 kB)
Downloading tensorboard_data_server-0.6.1-py3-none-manylinux2010_x86_64.whl (4.9 MB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 4.9/4.9 MB 61.1 MB/s eta 0:00:00
Downloading tensorboard_plugin_wit-1.8.1-py3-none-any.whl (781 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 781.3/781.3 kB 40.1 MB/s eta 0:00:00
Downloading urllib3-2.0.7-py3-none-any.whl (124 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 124.2/124.2 kB 11.7 MB/s eta 0:00:00
Downloading zipp-3.15.0-py3-none-any.whl (6.8 kB)
Downloading pyasn1-0.5.1-py2.py3-none-any.whl (84 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 84.9/84.9 kB 9.1 MB/s eta 0:00:00
Downloading requests_oauthlib-2.0.0-py2.py3-none-any.whl (24 kB)
Downloading oauthlib-3.2.2-py3-none-any.whl (151 kB)
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 151.7/151.7 kB 14.3 MB/s eta 0:00:00
Building wheels for collected packages: healthcheck, promise
  Building wheel for healthcheck (setup.py): started
  Building wheel for healthcheck (setup.py): finished with status 'done'
  Created wheel for healthcheck: filename=healthcheck-1.3.3-py3-none-any.whl size=4336 sha256=3486e26ba478a5ab3eb4e8021a71d380545f19676ea82de0174c83d4d6da7a89
  Stored in directory: /root/.cache/pip/wheels/b2/8f/c8/0a614b50d7033f9c97e919967f9afb7a6b6b61d5848c0a9c6a
  Building wheel for promise (setup.py): started
  Building wheel for promise (setup.py): finished with status 'done'
  Created wheel for promise: filename=promise-2.3-py3-none-any.whl size=21501 sha256=ffc1050af98468dc667af090098ac8b09a38cb7a614ead1b73fbcdcacab1d331
  Stored in directory: /root/.cache/pip/wheels/29/93/c6/762e359f8cb6a5b69c72235d798804cae523bbe41c2aa8333d
Successfully built healthcheck promise
Installing collected packages: tensorboard-plugin-wit, libclang, healthcheck, flatbuffers, dm-tree, zipp, wrapt, urllib3, typing-extensions, tqdm, toml, termcolor, tensorflow-io-gcs-filesystem, tensorflow-estimator, tensorboard-data-server, six, pyasn1, psutil, protobuf, packaging, oauthlib, numpy, MarkupSafe, keras, itsdangerous, idna, grpcio, gast, etils, dill, charset-normalizer, certifi, cachetools, absl-py, Werkzeug, rsa, requests, pyasn1-modules, proto-plus, promise, opt-einsum, Jinja2, importlib-resources, importlib-metadata, h5py, googleapis-common-protos, google-pasta, astunparse, tensorflow-metadata, requests-oauthlib, markdown, gunicorn, grpcio-status, google-cloud-audit-log, google-auth, click, tensorflow-datasets, grpc-google-iam-v1, google-auth-oauthlib, google-api-core, Flask, tensorboard, google-cloud-core, tensorflow, google-cloud-appengine-logging, google-cloud-logging
Successfully installed Flask-2.2.5 Jinja2-3.1.4 MarkupSafe-2.1.5 Werkzeug-2.2.3 absl-py-1.4.0 astunparse-1.6.3 cachetools-5.3.3 certifi-2024.6.2 charset-normalizer-3.3.2 click-8.1.7 dill-0.3.7 dm-tree-0.1.8 etils-0.9.0 flatbuffers-24.3.25 gast-0.4.0 google-api-core-2.19.0 google-auth-2.30.0 google-auth-oauthlib-0.4.6 google-cloud-appengine-logging-1.4.3 google-cloud-audit-log-0.2.5 google-cloud-core-2.4.1 google-cloud-logging-3.10.0 google-pasta-0.2.0 googleapis-common-protos-1.63.1 grpc-google-iam-v1-0.13.0 grpcio-1.62.2 grpcio-status-1.48.2 gunicorn-22.0.0 h5py-3.8.0 healthcheck-1.3.3 idna-3.7 importlib-metadata-6.7.0 importlib-resources-5.12.0 itsdangerous-2.1.2 keras-2.11.0 libclang-18.1.1 markdown-3.4.4 numpy-1.21.6 oauthlib-3.2.2 opt-einsum-3.3.0 packaging-24.0 promise-2.3 proto-plus-1.24.0 protobuf-3.19.6 psutil-6.0.0 pyasn1-0.5.1 pyasn1-modules-0.3.0 requests-2.31.0 requests-oauthlib-2.0.0 rsa-4.9 six-1.16.0 tensorboard-2.11.2 tensorboard-data-server-0.6.1 tensorboard-plugin-wit-1.8.1 tensorflow-2.11.0 tensorflow-datasets-4.8.2 tensorflow-estimator-2.11.0 tensorflow-io-gcs-filesystem-0.34.0 tensorflow-metadata-1.12.0 termcolor-2.3.0 toml-0.10.2 tqdm-4.66.4 typing-extensions-4.7.1 urllib3-2.0.7 wrapt-1.16.0 zipp-3.15.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
Removing intermediate container 17ca69562711
 48e6b90de01b
Step 7/7 : CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 SAGunicorn:app
 Running in e573f30d2846
Removing intermediate container e573f30d2846
 372952054dc7
Successfully built 372952054dc7
Successfully tagged gcr.io/shuchi-project/saflask-gke:latest
PUSH
Pushing gcr.io/shuchi-project/saflask-gke
The push refers to repository [gcr.io/shuchi-project/saflask-gke]
e84406d4dc1e: Preparing
ac23b98a1322: Preparing
2d3cd59d7e15: Preparing
b292581cd4dd: Preparing
b8594deafbe5: Preparing
8a55150afecc: Preparing
ad34ffec41dd: Preparing
f19cb1e4112d: Preparing
d310e774110a: Preparing
8a55150afecc: Waiting
ad34ffec41dd: Waiting
f19cb1e4112d: Waiting
d310e774110a: Waiting
b8594deafbe5: Layer already exists
8a55150afecc: Layer already exists
b292581cd4dd: Pushed
ad34ffec41dd: Layer already exists
f19cb1e4112d: Layer already exists
d310e774110a: Layer already exists
2d3cd59d7e15: Pushed
ac23b98a1322: Pushed
e84406d4dc1e: Pushed
latest: digest: sha256:756bf20f3a09c7a992f471e0e5f1146728fef677a1fa94cc5d97356826d98bb6 size: 2215
DONE
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ID: afc4f061-816a-41e4-afd5-8c5e13b75be7
CREATE_TIME: 2024-06-19T23:21:30+00:00
DURATION: 4M16S
SOURCE: gs://shuchi-project_cloudbuild/source/1718839276.467422-91c1da40bbce44779bfe655bff8a1ed0.tgz
IMAGES: gcr.io/shuchi-project/saflask-gke (+1 more)
STATUS: SUCCESS

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud builds list
ID: afc4f061-816a-41e4-afd5-8c5e13b75be7
CREATE_TIME: 2024-06-19T23:21:30+00:00
DURATION: 4M16S
SOURCE: gs://shuchi-project_cloudbuild/source/1718839276.467422-91c1da40bbce44779bfe655bff8a1ed0.tgz
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

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ gcloud container clusters create flaskapp-gke --num-nodes 1 --issue-client-certificate --scopes=https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/devstorage.read_only --zone "us-east1-d"
Default change: VPC-native is the default mode during cluster creation for versions greater than 1.21.0-gke.1500. To create advanced routes based clusters, please pass the `--no-enable-ip-alias` flag
Note: Your Pod address range (`--cluster-ipv4-cidr`) can accommodate at most 1008 node(s).
Creating cluster flaskapp-gke in us-east1-d... Cluster is being health-checked (master is healthy)...done.                                                                                                                                        
Created [https://container.googleapis.com/v1/projects/shuchi-project/zones/us-east1-d/clusters/flaskapp-gke].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-east1-d/flaskapp-gke?project=shuchi-project
kubeconfig entry generated for flaskapp-gke.
NAME: flaskapp-gke
LOCATION: us-east1-d
MASTER_VERSION: 1.29.4-gke.1043002
MASTER_IP: 34.75.220.132
MACHINE_TYPE: e2-medium
NODE_VERSION: 1.29.4-gke.1043002
NUM_NODES: 1
STATUS: RUNNING

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl apply -f deployment.yaml 
deployment.apps/flaskapp-gke created

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl get deployments
NAME           READY   UP-TO-DATE   AVAILABLE   AGE
flaskapp-gke   0/1     1            0           63m

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl get pods
NAME                            READY   STATUS             RESTARTS   AGE
flaskapp-gke-74595698c4-vjjpn   0/1     ImagePullBackOff   0          53m
flaskapp-gke-778d8d6fc-h8ncq    0/1     ImagePullBackOff   0          65m

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl apply -f service.yaml 
service/saclassifier created

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl get services
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes     ClusterIP      34.118.224.1    <none>        443/TCP        5m10s
saclassifier   LoadBalancer   34.118.233.70   <pending>     80:32462/TCP   9s
shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl get services
NAME           TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
kubernetes     ClusterIP      34.118.224.1    <none>          443/TCP        6m25s
saclassifier   LoadBalancer   34.118.233.70   34.138.10.247   80:32462/TCP   84s

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ curl 34.138.10.247/hcheck

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ curl 35.227.182.124/seclassifier -d '("text":"Still working my way through it but definitely c hanges your view on investment. Wish it was available on Audible")' -H 'Content-Type: application/json'

shuchimishra_ucla@cloudshell:~/tf-flask-app (shuchi-project)$ kubectl scale deployment flaskapp-gke --replicas 2
deployment.apps/flaskapp-gke scaled








