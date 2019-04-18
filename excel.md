* Getting the year from a date
```
=YEAR(A1)
```

* Getting the year from a date for every n-th row
```
=IF(MOD(ROW(),n)>0,"",YEAR(A1))
```

* Getting the average for every n-th row
```
=IF(MOD(ROW(),n)>0,"", AVERAGE(A1:OFFSET(A1,-(n-1))))
```

* Getting value for every n-th cell
```
=OFFSET($A$1,(ROW()*n)-1,0)
```
