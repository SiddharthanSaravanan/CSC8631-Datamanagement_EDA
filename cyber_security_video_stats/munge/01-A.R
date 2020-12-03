#Preprocessing script.

#Adding new column to the first datafile
cyber.security.3_video.stats$year = 2017
cyber.security.3_video.stats$month = "September"

#Adding new column to the second datafile
cyber.security.4_video.stats$year = 2017
cyber.security.4_video.stats$month = "November"

#combining two datafiles as a single datafile
video_stats_data = union_all(cyber.security.3_video.stats, cyber.security.4_video.stats)

#Converting the structure of two columns for analysis
video_stats_data$step_position = as.character(video_stats_data$step_position)
video_stats_data$month=factor(video_stats_data$month, ordered = TRUE,
                              levels = c("September","November"))

#Cleaning the data - Removing the columns that has values as 0
video_stats_data = video_stats_data[, colSums(video_stats_data != 0) > 0]

#Converting the dataset into a dataframe
video_stats_data = as.data.frame(video_stats_data)

#Analyse the structure of the data
str(video_stats_data)
