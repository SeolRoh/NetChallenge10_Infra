apt install -y ffmpeg
apt install -y vim
while true;
do
echo "---------------start Data_Preprocessing---------------";
start_time=$(date '+%s')
python3 Data_Preprocessing.py
end_time=$(date '+%s')
diff=$((end_time - start_time))
Data_hour=$((diff / 3600 % 24))
Data_minute=$((diff / 60 % 60))
Data_second=$((diff % 60))
echo "---------------finished Data_Preprocessing---------------";


echo "---------------start Train_DeepvoiceDetector---------------";
start_time=$(date '+%s')
python3 Train_DeepvoiceDetector.py
end_time=$(date '+%s')
diff=$((end_time - start_time))
Train_hour=$((diff / 3600 % 24))
Train_minute=$((diff / 60 % 60))
Train_second=$((diff % 60))
echo "---------------finished Train_DeepvoiceDetector---------------";


echo "---------------start send model---------------";
start_time=$(date '+%s')
docker build --tag seolroh/netchallenge_ai_model:latest .
docker push seolroh/netchallenge_ai_model:latest
end_time=$(date '+%s')
diff=$((end_time - start_time))
Serving_hour=$((diff / 3600 % 24))
Serving_minute=$((diff / 60 % 60))
Serving_second=$((diff % 60))
echo "---------------finished send model---------------";

echo "전처리 소요시간 $Data_hour 시간 $Data_minute 분 $Data_second 초"
echo "학습 소요시간 $Train_hour 시간 $Train_minute 분 $Train_second 초"
echo "서빙 소요시간 $Serving_hour 시간 $Serving_hour 분 $Serving_second 초"
echo "---------------wating 1day---------------";
sleep 86400;
echo "---------------1day passed---------------";
done;
#crontab