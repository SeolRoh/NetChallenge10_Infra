FROM python:3.9
RUN echo "/bin/bash"
WORKDIR /home
CMD tail -f /dev/null

COPY /home/ckpt /home/ckpt

# 서울 VM
#docker run -d -v /home/ckpt:/home/ckpt/DeepvoiceDetector_latest seolroh/netchallenge_ai_model

# 대전 VM
# docker pull seolroh/netchallenge_ai_model
# docker run -d --name modelserving_container seolroh/netchallenge_ai_model:latest
# sudo docker cp modelserving_container:/home/ckpt/DeepvoiceDetector_latest.pt /home/ubuntu/ckpt
# docker cp tmp_container:/home/data/test.md ~/data/ 
#docker pull seolroh/netchallenge_ai_model

# 코렌서버
#docker run -d -v /home/ckpt:/home/ckpt/DeepvoiceDetector_latest seolroh/netchallenge_ai_model

# COPY ckpt/DeepvoiceDetector_latest.pt /home/ckpt/DeepvoiceDetector_latest.pt