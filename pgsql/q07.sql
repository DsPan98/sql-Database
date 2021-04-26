SELECT vid from venue where area = 'A' and vid not in
(select vid from schedule where date = '2020-01-17')
Order by vid;
