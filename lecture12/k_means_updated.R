# For HW8, you'll be writing this yourselves and applying it to a data set. 

label_randomly <- function(n_points, n_clusters){
  sample(((1:n_points) %% n_clusters)+1, n_points, replace=F)
}

get_cluster_means <- function(data, labels){
  data %>%
    mutate(label__ = labels) %>%
    group_by(label__) %>%
    summarize(across(everything(), mean), .groups = "drop") %>%
    arrange(label__)
}

assign_cluster_fast <- function(data, means){
  data_matrix <- as.matrix(data)
  means_matrix <- as.matrix(means %>% dplyr::select(-label__))
  dii <- sort(rep(1:nrow(data), nrow(means)))
  mii <- rep(1:nrow(means), nrow(data))
  data_repped <- data_matrix[dii, ]
  means_repped <- means_matrix[mii, ]
  diff_squared <- (data_repped - means_repped)^2
  all_distances <- rowSums(diff_squared)
  tibble(dii=dii, mii=mii, distance=all_distances) %>%
    group_by(dii) %>%
    arrange(distance) %>%
    filter(row_number()==1) %>%
    ungroup() %>%
    arrange(dii) %>%
    pull(mii)
}

assign_cluster_slow <- function(data, means){    
  dii <- 1:nrow(data)
  cii <- 1:nrow(means)
  labels <- c()
  for(point_index in dii){
    smallest_dist <- Inf
    smallest_label <- NA
    for(clus_index in cii){
      point <- data[point_index, ]
      clus <- means %>% dplyr::select(-label__) %>% `[`(clus_index, )
      diff <- point - clus
      dist <- sum(diff * diff)
      if(dist < smallest_dist){
        smallest_dist <- dist
        smallest_label <- means[clus_index, ]$label__
      }
    }
    labels <- c(labels, smallest_label)
  }        
  labels    
}

kmeans_done <- function(old_means, new_means, eps=1e-6){
  om <- as.matrix(old_means)
  nm <- as.matrix(new_means)
  m <- mean(sqrt(rowSums((om - nm)^2)))
  if(m < eps) TRUE else FALSE
}

mykmeans <- function(data, n_clusters, eps=1e-6, max_it = 1000, verbose = FALSE){
  labels <- label_randomly(nrow(data), n_clusters)
  old_means <- get_cluster_means(data, labels)
  done <- FALSE
  it <- 0
  while(!done & it < max_it){
    labels <- assign_cluster_fast(data, old_means)
    new_means <- get_cluster_means(data, labels)
    if(kmeans_done(old_means, new_means)){
      done <- TRUE
    } else {
      old_means <- new_means
      it <- it + 1
      if(verbose){
        cat(sprintf("%d\n", it))
      }
    }
  }
  list(labels=labels, means=new_means)
}