import mysql.connector
import schedule
from time import time, sleep, strftime


def update(connection, cursor):
    querys = [
        'UPDATE `account` SET `PlayedTime` = `PlayedTime` + 1 WHERE `online` = 1',
        'UPDATE `account` SET `Mute` = `Mute` - 1 WHERE `online` = 1 AND `Mute` > 0',
        'UPDATE `account` SET `Jail` = `Jail` - 1 WHERE `online` = 1 AND `Jail` > 0',
    ]

    for query in querys:
        cursor.execute(query)
        connection.commit()
    print(strftime("%H:%M:%S"), "update account table")


def main():
    try:
        connection = mysql.connector.Connect(host='localhost', user='root', password='', database='bad mafia rp')
        cursor = connection.cursor()
    except mysql.connector.Error as err:
        print("Failed to connect to MySQL", err)
    
    schedule.every(1).minutes.do(update, connection, cursor)

    while True:
        schedule.run_pending()
        sleep(1)


if __name__ == '__main__':
    main()
