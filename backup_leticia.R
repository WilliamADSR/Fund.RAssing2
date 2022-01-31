## Cross-validation

Result model 1 here

```{r}
set.seed(42)
cross1 <- CVbinary(fit1, nfolds = 10)
```

Result model 2 here 

```{r}
set.seed(42)
cross2 <- CVbinary(fit2, nfolds = 10)
```
Result model 3 here

```{r}
set.seed(42)
cross3 <- CVbinary(fit3, nfolds = 10)
```
Result model 4 here

```{r}
set.seed(42)
cross4 <- CVbinary(fit4, nfolds = 10)
```

Comparison all results here

```{r}
c(fit1 = cross1$acc.cv, fit2 = cross2$acc.cv, fit3 = cross3$acc.cv, fit4 = cross4$acc.cv)
```




## Cross Validation

Result model 3 here

```{r}
set.seed(42)
cross3 <- CVbinary(fit3, nfolds = 10)
```

Result model 5 here.

```{r}
set.seed(42)
cross5 <- CVbinary(fit5, nfolds = 10)
```

Result model 6 here

```{r}
set.seed(42)
cross6 <- CVbinary(fit6, nfolds = 10)
```

Result model 7 here

```{r}
set.seed(42)
cross7 <- CVbinary(fit7, nfolds = 10)
```

Result model 8 here

```{r}
set.seed(42)
cross8 <- CVbinary(fit8, nfolds = 10)
```

Result model 9 here

```{r}
set.seed(42)
cross9 <- CVbinary(fit9, nfolds = 10)
```

Result model 10 here

```{r}
set.seed(42)
cross10 <- CVbinary(fit10, nfolds = 10)
```

Result  model 11 here

```{r}
set.seed(42)
cross11 <- CVbinary(fit11, nfolds = 10)
```

Comparing all the results here

```{r}
c(fit3 = cross3$acc.cv, fit5 = cross5$acc.cv, fit6 = cross6$acc.cv, 
  fit7 = cross7$acc.cv, fit8 = cross8$acc.cv, 
  fit9 = cross9$acc.cv, fit10 = cross10$acc.cv, 
  fit11 = cross11$acc.cv)
```
