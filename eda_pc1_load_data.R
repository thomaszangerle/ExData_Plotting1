# This function loads the data for the graph plotting,
# Creates a DateTime column from Date and Time
# Filter the date to 2007-02-01 and 2007-02-02
# and mutate the power and voltage to kW and kV

eda_pc1_load_data <- function(text_path){
  
  ## Reading the file
  eda_pc1_load_data <- read_csv2(text_path,na = "?", col_types = "ctnnnnnnn", n_max = 100000)
  
  ## Merging date and time
  eda_pc1_load_data <- eda_pc1_load_data %>% 
    mutate(DateTime = paste(Date, Time)) %>% # merging Date and time in DateTime column
    mutate(DateTime = as.POSIXct(strptime(DateTime, format = "%d/%m/%Y %H:%M:%S"))) %>% # arranging the format of the DateTime
    select(-c(Date,Time)) %>% # removing Date and Time columns
    select(DateTime, everything()) # moving DateTime as first column
  
  ## filtering the data
  eda_pc1_load_data <- filter(eda_pc1_load_data, DateTime >= "2007-02-01 00:00:00" & DateTime <= "2007-02-02 23:59:59")
  
  ## Mutating power in kW instead of W and voltage in kV instead of V
  eda_pc1_load_data <- mutate(eda_pc1_load_data, 
                  Global_active_power = Global_active_power/1000,
                  Global_reactive_power = Global_reactive_power/1000,
                  Sub_metering_1 = Sub_metering_1/1000,
                  Sub_metering_2 = Sub_metering_2/1000,
                  Sub_metering_3 = Sub_metering_3/1000,
                  Voltage = Voltage/1000)
}
  