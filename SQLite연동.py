# 파이썬 데이터 베이스 연동 (SQLite)

import sqlite3
import datetime

now =datetime.datetime.now()
print('now:',now)

nowDatetime =now.strftime('%Y-%m-%d %H:%M:%S')
print('nowDatetime',nowDatetime)

print()
print('sqlite3.version:',sqlite3.version)
print('sqlite3.sqlite_version',sqlite3.sqlite_version)


#DB 생성 & Auto commit(Rollback)

#auto commit 하기 위해 isolation 추가
conn = sqlite3.connect('C:/pythonbasic/resource/database.db',isolation_level=None)
 
# cursor
c = conn.cursor()
print('cursor Type:', type(c))

#테이블 생성(data type: text, numeric, integer, real blob)

c.execute("CREATE TABLE IF NOT EXISTS users(id INTEGER PRIMARY KEY,username text, email text , phone text, website text, regdate text )")

#데이터 삽입
c.execute ("INSERT INTO users VALUES(1, 'CHANG', 'hanhannnet@naver.com', '010-0000-0000',  'change.com', ? )", (nowDatetime,))

#다른 방법
c.execute("INSERT INTO users(id, username, email , phone,website, regdate) VALUES(?,?,?,?,?,?)",(2, 'PARK','Park@daum.net','010-0000-0000','park.com',nowDatetime))


#Many 삽입(튜플, 리스트)

userlist=(
    (3, 'Lee', 'Lee@naver.com', '010-2222-2222','Lee.com',nowDatetime),
    (4, 'Cho', 'cho@daum.net','010-3333-3333','Cho.com',nowDatetime),
    (5, 'Yoo', 'Yoo@google.com','010-4444-4444','Yoo.net',nowDatetime)
    



)

c.executemany("INSERT INTO users(id, username, email,phone,website,regdate) VALUES(?,?,?,?,?,?)",userlist)

#테이블 데이터 삭제
#conn.execute("DELETE FROM users")

#지워진 개수 출력
#print("users db deleted :",conn.execute("DELETE FROM users").rowcount)



#커밋 isolation_level =None 일 결우 자동 반영 (오토 커밋)

#오토 커밋이 아닐 경우 commit 직접 명령해야함

#롤백
#conn.rollback()
#접속 해제
conn.close()