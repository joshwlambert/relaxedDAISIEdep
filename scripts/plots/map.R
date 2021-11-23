# install required packages
install.packages(c("cowplot", "googleway", "ggplot2", "ggrepel", "ggspatial",
                   "libwgeom", "sf", "rnaturalearth", "rnaturalearthdata",
                   "rnaturalearthhires"))

#load required packages
library("ggplot2")
library("sf")
library("rnaturalearth")
library("rnaturalearthdata")
library("ggspatial")
library("rnaturalearthhires")

archipelagos <- data.frame(
  longitude = c(47.0499998,-30.384108, -23.6051721, -176.523997904, 43.3725967,
                -91.142578, -70.666664, -118.278, -155.844437, -78.8499966,
                159.083333, -16.2749989, 145.7065244, -139.38666512, 57.6755,
                165.8517014, 174.763336, -169.867233, 167.9543925, 142.21749913,
                134.582520, 55.526164, -172.10476, 6.602781, 55.4494781,
                -110.949996),
  latitude = c(-9.6999972, 38.305542, 15.120142, -43.892329764, -11.6519809,
               -0.777259, 19.0, 29.039, 19.741755, -33.6333308, -31.5499978,
               32.37166518, 15.1063896, -9.452664856, -20.20665, -21.2107283,
               -36.848461, -19.054445, -29.0328267, 26.992162698, 7.514980,
               -21.108666232, -13.7583109, 0.255436, -4.6838871, 18.6999972))

world <- ne_countries(scale = "medium", returnclass = "sf")

ggplot(data = world) +
  geom_sf(color = "black", fill = "antiquewhite") +
  xlab("Longitude") + ylab("Latitude") +
  theme(panel.grid.major = element_line(color = gray(0.5),
                                        linetype = "dashed",
                                        size = 0.5),
        panel.background = element_rect(fill = "aliceblue")) +
  geom_point(data = archipelagos, aes(x = longitude, y = latitude), size = 3,
             shape = 16, alpha = 0.7)
ggsave("map.png", dpi=300, dev='png', height=4.5, width=6.5, units="in")


