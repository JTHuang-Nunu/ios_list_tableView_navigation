# hw2 - list

> 本次主要遇到的難題在 不知道怎樣傳資料到其他View Control
> 

## 實作

- table view
    - cell
        - display image
    - isEditing
    - .delete .insert
    - move
- nagivation
- button
    - isEnabled

### tableView

裡面有很多override可以操作

1. 可以進到cell進行資料指定
<img width="700" alt="Untitled" src="https://user-images.githubusercontent.com/65273988/227222784-55ecc15f-c5af-46fb-b79f-e006e2f556ee.png">
    
    只要在TableViewCell寫好就可以了
    
<img width="386" alt="Untitled 1" src="https://user-images.githubusercontent.com/65273988/227222882-588a53e8-68ce-452d-ab5c-97211cf9c078.png">
    
2. 當新增或刪除檔案一定要reload不然動的只有畫面，後端資料不會跟著改變
    
<img width="717" alt="Untitled 2" src="https://user-images.githubusercontent.com/65273988/227222939-69143f78-e1f3-453b-8b27-bdc291df1f6f.png">
    
3. 如果要在tableView 用image，一定要把它放到Asset上，不然不會動
    
<img width="1176" alt="Untitled 3" src="https://user-images.githubusercontent.com/65273988/227222959-01ac305d-394e-41fc-9341-4d4a912981c1.png">
    

### Nagivation

1. 傳遞給其他ViewController資料
    
<img width="685" alt="Untitled 4" src="https://user-images.githubusercontent.com/65273988/227223066-19ae042d-3cb6-4c61-b4e7-9429a4233001.png">
    
2. 在Main一定要把navigation指定給首頁
選擇root view controller
    
<img width="548" alt="Untitled 5" src="https://user-images.githubusercontent.com/65273988/227223121-104e2fc4-7333-4808-9315-b6025e988455.png">
    
3. 記得一定要勾選initial View Controller
    
<img width="934" alt="%E6%88%AA%E5%9C%96_2023-03-23_%E4%B8%8B%E5%8D%889 33 09" src="https://user-images.githubusercontent.com/65273988/227223163-eb72ccc7-1a52-417e-94d1-610c335bf883.png">
