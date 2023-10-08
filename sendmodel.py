import ftplib
import time

HOST = ""
PORT = 22
ID = "" # ftp 서버의 본인 ID
PW = "" # ftp 서버의 본인 패스워드

def main():
        ftp = ftplib.FTP(host=HOST)
        ftp.set_pasv(False)
        ftp.login(user=ID, passwd=PW)
        ftp.dir()

        start_time = time.time()
        with open('/root/ckpt/test.pt, 'rb') as read_f:
                ftp.storbinary("STOR "+"DeepvoiceDetector_latest.pt", read_f)
        end_time = time.time()

        print('finished Model Serving')
        print(".pt file transfer time is : ", end_time-start_time)
        
if __name__ == '__main__':
    main()