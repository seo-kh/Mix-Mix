# Mix-Mix
- Personal SwiftUI Project

## 소개
* [칵테일API](http://cocktail-recipes-tully4school.herokuapp.com/drinks)를 이용하여, 알코올/논알코올 탭에 따른 칵테일을 소개해주는 앱입니다.
* `List 형태의 뷰`를 만들고 해당 칵테일 리스트를 탭하면, 상세화면으로 네비게이션하도록 만들었습니다.

## SKILLS
- **SwiftUI**
- **Combine**

## CODE

* Apple 공식 문서 > URLSessionDataTaskPublisher [link](https://developer.apple.com/documentation/foundation/urlsession/processing_url_session_data_task_results_with_combine)를 참고하여, 칵테일 데이터 parsing.
```swift
/// Combine Code
func loadDataPublisher(_ url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryCompactMap(self.jsonSerialization)
            .map(self.mappingDrink)
            .sink { completion in
                switch completion {
                case .finished:
                    print("well done")
                case .failure(let error):
                    print("Error Decoding.. \(error)")
                }
            } receiveValue: { [weak self] drinks in
                self?.drinks = drinks
            }
            .store(in: &cancellables)
```

* Views
<table>
    <tr>
        <td>
            ContentView <u>(initial point)</u>
        </td>
    </tr>
    <tr>
        <td>
            CocktailListView <u>(list)</u>
        </td>
    </tr>
    <tr>
        <td>
            CocktailListCellView <u>(cell)</u>
        </td>
        <td>
            CocktailDetailView <u>(detail)</u>
        </td>
    </tr>
</table>


## DEMO
<p align=center>
    <img width="30%" src="img/mixmix.gif" style={"corner-radius": 12px}>
</p>

