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
`magrittr`: part of the tidyverse that allows us to build pipelines  
`%>%`: binary operator that stitches together its arguments - super useful!  
**joins:** combining data sets  
**left join:** keep every row from the left table, substitute some missing or other value for right table values when there is not a match  
**right join:** keep every row from the right table, substitute some missing or other value for left table values when there is not a match  
**inner join:** keep only rows where there is a matching index  
**cross join:** combines every row from one data frame with every row from another data frame  
**wide data:** data with many observations per row  
**pivot longer:** converts columns to observations  
**pivot wider:** converts observations to columns  
`select(c1,c2,...)`: returns a new data frame with only the selected columns  
`rename(new_name=old_name, ...)`: return a new data frame with the renamings  
`mutate(name=expr,...)`: adds or modifies columns  
`filter(boolean_expr)`: returns a dataframe with only matching rows  
`group_by(expr,...)`: group by an expression or multiple columns  
`tally`: count the elements in the grouping and return a data frame with the group keys and the count  
`summarize(name=expr,...)`: operate per group and produce a table of summaries  
`ggplot`: tidyverse plot function; works by letting you associate data with aesthetics; chains with `+`  
`geom_point`: points  
`geom_histogram`: histogram, performs aggregation itself (geom_bar + stat bin)  
`geom_density`: density plot (using a kernel density estimate)  
`geom_boxplot`: boxplot (plots centroids and widths w/ outliers)  
`geom_rect`: general rectangles  
`geom_bar`: bar graph can perform all sorts of aggregations  
`color`: the color of a point or shape or the color of the boundary of a polygon or rectangle  
`fill`: the color of the interior of a polygon or rectangle  
`alpha`: the transparency of a color  
`position`: for histograms and bar plots how to position boxes for the same x aesthetic. "dodge" is the most clear  

