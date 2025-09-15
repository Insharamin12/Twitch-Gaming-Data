# 📊 Twitch Data Analysis Project

Twitch is the world’s leading live streaming platform for gamers, with over **240 million monthly active users**.  
This project explores **viewer behavior** and **chat activity** using two datasets provided by the Twitch Science Team:

- **`stream` table** → Stream viewing data  
- **`chat` table** → Chat room usage data  

The goal is to practice SQL skills by analyzing these datasets, uncovering insights about games, channels, users, and engagement patterns.

---

## 🚀 Project Overview

The project is structured into a series of SQL tasks:

1. **Getting Started**
   - Preview the `stream` and `chat` tables
   - Explore column names and data formats
   - Identify unique games and channels  

2. **Aggregate Functions**
   - Find the most popular games  
   - Analyze **League of Legends** viewers by country  
   - Count players (devices/platforms used to view streams)  
   - Categorize games into **genres** (MOBA, FPS, Survival, Other)  

3. **Time-Based Analysis**
   - Inspect the `time` column (DATETIME format)  
   - Use `strftime()` to extract parts of timestamps  
   - Explore how viewership changes by **hour of the day**  

4. **Joining Tables**
   - Join `stream` and `chat` on `device_id`  
   - Combine viewing and chat activity for deeper insights  

5. **Extended Exploration**
   - Top games with the most chat activity  
   - Channels with the most engaged viewers  
   - Compare viewers vs. chat activity for favorite games  
   - Peak chat activity by hour of day  
   - Most “chatty” countries (messages per viewer ratio)  

---

## 🗂️ Dataset

The practice dataset contains around **800,000 rows** and is publicly available on GitHub:

- `stream.csv` → Stream viewing data  
- `chat.csv` → Chat room usage data  

> ⚠️ Note: This dataset is provided by the Twitch Science Team for educational purposes.

---

## 🛠️ Tech Stack

- **SQL** → Data exploration and analysis  
- **GitHub** → Dataset hosting and version control  

---

