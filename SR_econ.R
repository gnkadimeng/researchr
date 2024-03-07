load("~/Projects-2023/Literature_research_tools/litsearchr/session_econ.RData")

keywords_data <- term_strengths

percentile_95_strength <- quantile(keywords_data$strength, 0.991)

# Filter the data to include only terms above the 95th percentile strength
top_terms <- keywords_data[keywords_data$strength >= percentile_95_strength, ]

# Plot the results
plot(top_terms$rank, top_terms$strength, 
     main = "Rank vs Strength for 99th Percentile Terms",
     xlab = "Rank",
     ylab = "Strength",
     pch = 16, col = "blue", cex = 1.5)

# Add vertical labels for top terms
text(top_terms$rank, top_terms$strength, labels = top_terms$term, pos = 4, col = "red", cex = 0.6, srt = 90)

# Add a horizontal line at the 95th percentile strength level
abline(h = percentile_95_strength, col = "red", lty = 2)

# Add a vertical line at the median rank
median_rank <- median(top_terms$rank)
abline(v = median_rank, col = "green", lty = 2)

# Add legend
legend("topright", legend = c("99th Percentile Strength", "Median Rank"), 
       col = c("red", "green"), lty = c(2, 2), cex = 0.8)


# Assuming 'plot()' code has been executed before adding the footnote

