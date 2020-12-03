#Load the project
library('ProjectTemplate')
load.project()

#EDA of numerical summaries
summary(video_stats_data[,21:26])

#Find the correlation between two columns
cor(video_stats_data[,5], video_stats_data[,7])

#EDA of graphical summaries
#Plot 1 represents total views based on courses for 2 different months
plot1 = ggplot(video_stats_data, aes(step_position, total_views, fill = month))+geom_col(position = 'dodge') +
  ggtitle(wrapper("Analysis of Total views of the courses between two months", width = 50))
#Save the plot1 in the graphs directory
ggsave(file.path('graphs','plot1.pdf'))

#Plot 2 represents asia_views based on courses stating which course has viewed 100%
plot2 = ggplot(video_stats_data, aes(step_position, asia_views_percentage, fill = viewed_onehundred_percent))+geom_col(position = 'dodge') + labs(fill = "Viewed 100%") + 
  ggtitle(wrapper("Analysis of the courses based on views percentage from Asia region", width = 45))
#Save the plot2 in the graphs directory
ggsave(file.path('graphs','plot2.pdf'))

#Plot 3 Europe view percentage for each courses on different months
plot3 = ggplot(video_stats_data, aes(step_position, europe_views_percentage, color = month, alpha = video_duration, size = video_duration)) + geom_point() +
  ggtitle(wrapper("Analysis of the courses based on views percentage from Europe region", width = 50))
#Save the plot3 in the graphs directory
ggsave(file.path('graphs','plot3.pdf'))

#Plot 4
plot4 = ggplot(video_stats_data)+geom_line(aes(x=video_duration, y=north_america_views_percentage, color = month)) +
  ggtitle(wrapper("Analysis of the video duration based on views percentage from North America region", width = 50))
#Save the plot4 in the graphs directory
ggsave(file.path('graphs','plot4.pdf'))

#Plot 5
plot5 = ggplot(video_stats_data, aes(total_views, desktop_device_percentage, color = month, size = total_views)) + geom_point() +
  ggtitle(wrapper("Analysis of desktop users based on total views of the modules", width = 50))
#Save the plot5 in the graphs directory
ggsave(file.path('graphs','plot5.pdf'))

#Plot 6
plot6 = ggplot(video_stats_data, aes(step_position, total_downloads, size = viewed_hd, color = month)) + geom_point() +
  ggtitle("Analysis of modules downloaded in HD format")
#Save the plot6 in the graphs directory
ggsave(file.path('graphs','plot6.pdf'))

#plot 7
plot7 = ggplot(video_stats_data) + geom_col(aes( month, total_downloads, fill=factor(step_position)), position="dodge") + labs(fill = "Course modules") +
  ggtitle("Analysis of modules downloaded in different months")
#Save the plot7 in the graphs directory
ggsave(file.path('graphs','plot7.pdf'))

#Plot8
plot8 = ggplot(video_stats_data, aes(total_downloads, total_transcript_views, color = month)) + geom_line() + 
  ggtitle(wrapper("Analysis of total downloads made as transcripts"))
#Save the plot8 in the graphs directory
ggsave(file.path('graphs','plot8.pdf'))
