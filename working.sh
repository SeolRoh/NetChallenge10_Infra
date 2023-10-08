apt-get install -y ffmpeg
while true;
do
python3 Data_Preprocessing.py
python3 Train_DeepvoiceDetector.py
sleep 86400;
echo "1 day passed";
done;
#crontab