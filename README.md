# 🎮 Twitch Data Analysis with SQL

This project explores **Twitch stream viewing data** and **chat activity** using SQL.  
The dataset (≈800k rows), provided by the **Twitch Science Team**  is publicly available and contains two main tables:

- **`stream`** → Information about streams (viewing data)  
- **`chat`** → Information about chat messages (engagement data)  

The goal is to uncover insights about games, viewers, and chat behavior.

---

## 📂 Dataset Schema

### `stream` table
- `time` – Timestamp of stream activity (`YYYY-MM-DD HH:MM:SS`)  
- `device_id` – Unique device identifier (join key with `chat`)  
- `login` – Viewer username  
- `channel` – Channel being streamed  
- `country` – Viewer country  
- `player` – Platform/device used (site, iPhone, Android, etc.)  
- `game` – Game being streamed  
- `stream_format` – Video quality (e.g., 1080p, 720p)  
- `subscriber` – Subscriber flag  

### `chat` table
- `time` – Timestamp of chat message  
- `device_id` – Unique device identifier (join key with `stream`)  
- `login` – Viewer username  
- `channel` – Channel where the chat occurred  
- `country` – Country of the chatter  
- `player` – Platform/device used  
- `game` – Game related to the chat  

---

## 🚀 Queries & Analysis

### 1. Getting Started
- Previewed first rows of both `stream` and `chat` tables  
- Retrieved all unique games and channels  

### 2. Aggregate Functions
- Counted the number of streams per game to find **most popular games**  
- Analyzed **League of Legends** viewers by country  
- Counted viewers by platform (`player`)  
- Categorized games into genres (`MOBA`, `FPS`, `Survival`, `Other`) using `CASE`  

### 3. Time-Based Analysis
- Previewed the `time` column to understand `DATETIME` format  
- Used `strftime()` to extract seconds and hours  
- Counted viewership by **hour of the day** (for US viewers)  

### 4. Joining Tables
- Joined `stream` and `chat` on `device_id` to combine viewing & chat activity  

### 5. Favorite Games Analysis (League of Legends & Dota 2)
- **Viewership stats** → unique viewers & total streams  
- **Chat stats** → unique chatters & total messages  
- **Engagement ratio** → messages per viewer  
- **Country breakdown** → which countries are most engaged  
- **Subscriber analysis** → compared chat activity of subscribers vs. non-subscribers  

---

## 🛠️ Tech Stack

- **SQL** → Data exploration and analysis  
- **GitHub** → Dataset hosting and version control  

---

## 📈 Key Insights

- **League of Legends** and **Dota 2** dominate viewership and engagement.  
- **MOBA games** generate significantly higher traffic compared to FPS and Survival games.  
- Viewer activity peaks at certain **hours of the day**, especially in the US.  
- Some countries produce more **messages per viewer**, indicating higher engagement levels.  
- **Subscribers** tend to be more active in chat than non-subscribers.  

