setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source("../../scripts/h2o-r-test-setup.R")

# problem with merge.
test <- function() {
    # wendy code
    browser()
    left <- data.frame(fruit = c(0,1,2,3,4), color <- c('red', 'orange', 'yellow', 'red', 'blue'))
    right <- data.frame(fruit = c(3), citrus <- c(FALSE))
    left_hf <- as.h2o(left)
    right_hf <- as.h2o(right)
    
    merged <- h2o.merge(left_hf, right_hf, all.x = TRUE)
    print(merged)
    
    # customer code
    left <- data.frame(fruit = c(-177000000, -4000000, 100000000000, 200000000000, 1000000000000),
                       color <- c('red', 'orange', 'yellow', 'red', 'blue'))

    right <- data.frame(fruit = c(-177000000), citrus <- c(FALSE))

    left_hf <- as.h2o(left)
    right_hf <- as.h2o(right)

    merged <- h2o.merge(left_hf, right_hf, all.x = TRUE)
    print(merged)

    # example from Neema
    left <- data.frame(fruit = c(-177000000, -4000000, 100000000000, 200000000000, 1000000000000),
                       color <- c('red', 'orange', 'yellow', 'red', 'blue'))
    right <- data.frame(fruit = c(-177000000, -177000000),
                        citrus <- c(FALSE))
    left_hf <- as.h2o(left)
    right_hf <- as.h2o(right)
    merged <- h2o.merge(left_hf, right_hf, all.x = TRUE)
    
}

doTest("PUBDEV-3567", test)
