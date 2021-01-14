library(tidyverse)
library(ggforce)
library(here)

# Following the NHL rule book:
# https://cms.nhl.bamgrid.com/images/assets/binary/308893668/binary-file/file.pdf

nhl_rink_plot <- function () {
  
ggplot() +
  
  # Faceoff circles
  geom_circle(aes(x0 = 0, y0 = 0, r = 15), colour = "#E6EFFF", size = 2 / 12) + # Centre
  geom_circle(aes(x0 = 69, y0 = 22, r = 15), colour = "#FFE6EB", size = 2 / 12) + # Top-Right
  geom_circle(aes(x0 = 69, y0 = -22, r = 15), colour = "#FFE6EB", size = 2 / 12) + # Bottom-Right
  geom_circle(aes(x0 = -69, y0 = 22, r = 15), colour = "#FFE6EB", size = 2 / 12) + # Top-Left
  geom_circle(aes(x0 = -69, y0 = -22, r = 15), colour = "#FFE6EB", size = 2 / 12) + # Bottom-Left
  
  # Hash marks in T-R/B-R/T-L/B-R order, groups of four
  geom_tile(aes(x = 66.125, y = 37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.125, y = 6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.875, y = 37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.875, y = 6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.125, y = -37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.125, y = -6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.875, y = -37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.875, y = -6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.125, y = 37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.125, y = 6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.875, y = 37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.875, y = 6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.125, y = -37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.125, y = -6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.875, y = -37.77, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.875, y = -6.23, width = 2 / 12, height = 2), fill = "#FFE6EB") +
  
  # Centre line
  geom_tile(aes(x = 0, y = 0, width = 1, height = 85), fill = "#FFE6EB") + # Centre line

  # Faceoff dots - Plot AFTER centre lines for centre ice circle to show up above
  geom_circle(aes(x0 = 0, y0 = 0, r = 6 / 12), colour = "#FFCCCC", fill = "#FFCCCC", size = 0) + # Centre
  geom_circle(aes(x0 = 69, y0 = 22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Top-Right
  geom_circle(aes(x0 = 69, y0 = -22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Bottom-Right
  geom_circle(aes(x0 = -69, y0 = 22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Top-Left
  geom_circle(aes(x0 = -69, y0 = -22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Bottom-Left
  
  geom_circle(aes(x0 = 20.5, y0 = 22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Neutral Top-Right
  geom_circle(aes(x0 = 20.5, y0 = -22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Neutral Bottom-Right
  geom_circle(aes(x0 = -20.5, y0 = 22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Neutral Top-Left
  geom_circle(aes(x0 = -20.5, y0 = -22, r = 1), colour = "#FFE6EB", fill = "#FFE6EB", size = 0) + # Neutral Bottom-Left
  
  # Ells surrounding faceoff dots
  geom_tile(aes(x = 65, y = 22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") + # Top-Right
  geom_tile(aes(x = 73, y = 22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 65, y = 21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 73, y = 21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.92, y = 24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.08, y = 24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.92, y = 19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.08, y = 19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  
  geom_tile(aes(x = 65, y = -22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") + # Bottom-Right
  geom_tile(aes(x = 73, y = -22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 65, y = -21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 73, y = -21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.92, y = -24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.08, y = -24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = 66.92, y = -19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = 71.08, y = -19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  
  geom_tile(aes(x = -65, y = 22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") + # Top-Left
  geom_tile(aes(x = -73, y = 22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -65, y = 21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -73, y = 21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.92, y = 24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.08, y = 24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.92, y = 19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.08, y = 19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  
  geom_tile(aes(x = -65, y = -22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") + # Bottom-Left
  geom_tile(aes(x = -73, y = -22.83, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -65, y = -21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -73, y = -21.17, width = 4, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.92, y = -24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.08, y = -24.25, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = -66.92, y = -19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  geom_tile(aes(x = -71.08, y = -19.75, width = 2 / 12, height = 3), fill = "#FFE6EB") +
  
  # Referee crease
  geom_arc(aes(x0 = 0, y0 = -42.5, start = -pi / 2, end = pi / 2, r = 10), colour = "#FFE6EB") +
  
  # Left goalie crease
  geom_tile(aes(x = -86.75, y = 0, width = 4.5, height = 8), fill = "#E6F9FF") +
  geom_arc_bar(aes(x0 = -89, y0 = 0, start = atan(4.5/4) - 0.01, end = pi - atan(4.5 / 4) + 0.01, r0 = 4, r = 6), fill = "#E6F9FF", colour = "#E6F9FF", size = 1 / 12) + # manually adjusted arc
  geom_tile(aes(x = -86.75, y = -4, width = 4.5, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = -86.75, y = 4, width = 4.5, height = 2 / 12), fill = "#FFE6EB") +
  geom_arc(aes(x0 = -89, y0 = 0, start = atan(4.5/4) - 0.01, end = pi - atan(4.5 / 4) + 0.01, r = 6), colour = "#FFE6EB", size = 2 / 12) + # manually adjusted arc
  geom_tile(aes(x = -85, y = 3.75, width = 2 / 12, height = 0.42), fill = "#FFE6EB") +
  geom_tile(aes(x = -85, y = -3.75, width = 2 / 12, height = 0.42), fill = "#FFE6EB") +
  
  # Right goalie crease
  geom_tile(aes(x = 86.75, y = 0, width = 4.5, height = 8), fill = "#E6F9FF") +
  geom_arc_bar(aes(x0 = 89, y0 = 0, start = -atan(4.5/4) + 0.01, end = -pi + atan(4.5 / 4) - 0.01, r0 = 4, r = 6), fill = "#E6F9FF", colour = "#E6F9FF", size = 1 / 12) + # manually adjusted arc
  geom_tile(aes(x = 86.75, y = -4, width = 4.5, height = 2 / 12), fill = "#FFE6EB") +
  geom_tile(aes(x = 86.75, y = 4, width = 4.5, height = 2 / 12), fill = "#FFE6EB") +
  geom_arc(aes(x0 = 89, y0 = 0, start = -atan(4.5/4) + 0.01, end = -pi + atan(4.5 / 4) - 0.01, r = 6), colour = "#FFE6EB", size = 2 / 12) + # manually adjusted arc
  geom_tile(aes(x = 85, y = 3.75, width = 2 / 12, height = 0.42), fill = "#FFE6EB") +
  geom_tile(aes(x = 85, y = -3.75, width = 2 / 12, height = 0.42), fill = "#FFE6EB") +
  
  # Goalie nets placed as rectangles
  geom_tile(aes(x = -90.67, y = 0, width = 3.33, height = 6), fill = "#F2F2F2") + # Left
  geom_tile(aes(x = 90.67, y = 0, width = 3.33, height = 6), fill = "#F2F2F2") + # Right
  
  # Trapezoids
  geom_polygon(aes(x = c(-100, -100, -89, -89), y = c(10.92, 11.08, 7.08, 6.92)), fill = "#FFE6EB") + # Left
  geom_polygon(aes(x = c(-100, -100, -89, -89), y = c(-10.92, -11.08, -7.08, -6.92)), fill = "#FFE6EB") + # Left 
  geom_polygon(aes(x = c(100, 100, 89, 89), y = c(10.92, 11.08, 7.08, 6.92)), fill = "#FFE6EB") + # Right
  geom_polygon(aes(x = c(100, 100, 89, 89), y = c(-10.92, -11.08, -7.08, -6.92)), fill = "#FFE6EB") + # Right
  
  # Lines
  geom_tile(aes(x = -25.5, y = 0, width = 1, height = 85), fill = "#E6EFFF") + # Left Blue line
  geom_tile(aes(x = 25.5, y = 0, width = 1, height = 85),  fill = "#E6EFFF") + # Right Blue line
  geom_tile(aes(x = -89, y = 0, width = 2 / 12, height = 73.50), fill = "#FFE6EB") + # Left goal line (73.5 value is rounded from finding intersect of goal line and board radius)
  geom_tile(aes(x = 89, y = 0, width = 2 / 12, height = 73.50), fill = "#FFE6EB") + # Right goal line
  
  # Borders as line segments - plotted last to cover up line ends, etc.
  geom_line(aes(x = c(-72, 72), y = c(42.5, 42.5))) + # Top
  geom_line(aes(x = c(-72, 72), y = c(-42.5, -42.5))) + # Bottom
  geom_line(aes(x = c(-100, -100), y = c(-14.5, 14.5))) + # Left
  geom_line(aes(x = c(100, 100), y = c(-14.5, 14.5))) + # Right
  geom_arc(aes(x0 = 72, y0 = 14.5, start = pi / 2, end = 0, r = 28)) + # Top-Right
  geom_arc(aes(x0 = 72, y0 = -14.5, start = pi, end =  pi / 2, r = 28)) + # Bottom-Right
  geom_arc(aes(x0 = -72, y0 = 14.5, start = - pi / 2, end = 0, r = 28)) + # Top-Left
  geom_arc(aes(x0 = -72, y0 = -14.5, start = pi, end =  3 * pi / 2, r = 28)) + # Bottom-Left
  
  # Fixed scale for the coordinate system  
  coord_fixed()
}

# theme_void() # include this for a blank plot, but likely easier to include in ggplot2 function in main code to control layering