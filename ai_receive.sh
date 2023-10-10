
echo "----------------start container run"
echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
start_time=$(date '+%s')
docker run -d --name modelserving_container seolroh/netchallenge_ai_model:latest
end_time=$(date '+%s')
echo "----------------finished container run"
echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
diff=$((end_time - start_time))
hour=$((diff / 3600 % 24))
minute=$((diff / 60 % 60))
second=$((diff % 60))
echo "컨테이너 작동 소요시간 $hour 시간 $minute 분 $second 초"
sleep 5;



echo "----------------start copy .pt"
echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
start_time=$(date '+%s')
sudo docker cp modelserving_container:/root/ckpt/DeepvoiceDetector_latest.pt /home/ubuntu/ckpt
end_time=$(date '+%s')
echo "----------------finished copy .pt"
echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
diff=$((end_time - start_time))
hour=$((diff / 3600 % 24))
minute=$((diff / 60 % 60))
second=$((diff % 60))
echo "컨테이너 내 pt 이동 소요시간 $hour 시간 $minute 분 $second 초"
sleep 5;



echo "----------------removing container"
echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
start_time=$(date '+%s')
docker rm -f modelserving_container
docker rmi -f seolroh/netchallenge_ai_model:latest
end_time=$(date '+%s')
echo "----------------removedcontainer"
echo "data now : $(date +%Y)-$(date +%m)-$(date +%d) $(date +%H):$(date +%M):$(date +%S)"
diff=$((end_time - start_time))
hour=$((diff / 3600 % 24))
minute=$((diff / 60 % 60))
second=$((diff % 60))
echo "컨테이너 삭제 소요시간 $hour 시간 $minute 분 $second 초"
echo "---------------wating 1day---------------";
sleep 86400;
echo "---------------1day passed---------------";
#vi /etc/crontab
#0 * * * * root /home/backup/test.sh 1시간마다 실행
# crond 재실행
#systemctl restart crond
# 로그 경로
#cat /var/log/cron

#상태보기
#sudo service cron status