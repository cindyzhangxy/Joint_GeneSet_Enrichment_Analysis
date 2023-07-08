library(data.table)
library(tidyverse)
library(ggplot2)
f <- fread("./jag.merged.P1.empp")

f <- f %>% 
  select(-c("var(Perms)", "mean(Perms)"))

sumlogReal <- f$sumlogReal %>% 
  as.data.frame() 



sumlog <- fread("./jag.merged.P1.perm")
sumlog <- sumlog %>% 
  select(-seed) 

colnames(sumlogReal) <- colnames(sumlog)

gather(sumlog[1:10000,]) %>% 
  tail()  

ggplot(gather(sumlog)) + 
  geom_histogram(aes(value, color = key, fill=key),bins =50,col=I("black")) +  
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  facet_wrap(~key, scales = 'free_x') + 
  labs(x = "Sum(-logP) of SNPs") 
  

  

