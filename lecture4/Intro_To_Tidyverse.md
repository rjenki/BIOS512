# Intro to Tidyverse

## Common Problems With Data Sets
1. duplicate data - deadly!
2. pseudo-duplicate data - even worse!: when data is not strictly identical but highly correalated to another set of records
3. missing data (or 0s in place of missing data)
4. incorrectly encoded missing data: when missing data shows as multiple values (blank, "", "NA", "-", "NULL", etc.)
5. poorly encoded data dumps: will cause data to shift weird (ex: CSV file where a comma is in the middle of another value and it is read wrong)
6. inconsistently encoded dates or values  
We will use Tidyverse to help us with these issues!

## Key words
`readr`: loads a file into a data frame  
`dplyr`: R package for data manipulation  
`tibble`: `dplyr`'s more efficient data frame class (like table)  

**MORE COMING SOON!**


