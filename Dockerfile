FROM python:3.9
RUN echo "/bin/bash"
# ENTRYPOINT "/bin/bash"
CMD tail -f /dev/null
RUN apt-get update && apt-get install -y
RUN pip install tqdm numpy pandas scikit-learn transformers==4.18.0 tokenizers==0.12.1 soundfile==0.10.3.post1
RUN pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
RUN mkdir dataset
WORKDIR /root

COPY Data_Preprocessing.py /root/Data_Preprocessing.py
COPY config.py /root/config.py
COPY merdataset.py /root/merdataset.py
COPY utils.py /root/utils.py
COPY models/kwav2vec_model.py /root/models/kwav2vec_model.py
COPY Train_DeepvoiceDetector.py /root/Train_DeepvoiceDetector.py
COPY Data_Preprocessing.py /root/Data_Preprocessing.py
COPY working.sh /root/working.sh
COPY sendmodel.py /root/sendmodel.py


# 1. docker build --tag seolroh/netchallenge:0.14 .
# 2. docker push seolroh/netchallenge:0.14
# 3. docker run -v ~/ai/NetChallenge10/dataset:/root/dataset seolroh/netchallenge:0.14
# 3-1 hpc 버전 docker run -d --gpus all -v ~/dataset:/root/dataset seolroh/netchallenge:0.14
# 4. docker exec -it {containerid} /bin/bash

# in container
# run sh working.sh

# 일요일 출근해서 할일
# ftp 각 에지에서 하루마다 폴더 경로에 가져오기
# ~/dataset/2023-10-07/fake
# ~/dataset/2023-10-07/real
# sftp -P 13220 icns@210.114.91.98