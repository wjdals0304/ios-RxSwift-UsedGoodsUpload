# ios-RxSwift-UsedGoodsUpload
- 30개프로젝트로배우는 iOS앱개발 with Swift초격차 패키지Online

<img src="https://user-images.githubusercontent.com/26668309/165235826-78ddc82e-aa38-42f5-bc1f-48ad37838ff7.png" width=30%><img src="https://user-images.githubusercontent.com/26668309/165235843-26f27542-5c00-4929-87fd-10b3e2a15822.png" width=30%>


# 사용요소
- RxSwift 

# 배운내용
-  Rx extension  
 RxCocoa에 없는 경우 커스텀해서 사용

```Swift 
extension Reactive where Base: MainViewController {
    var setAlert: Binder<Alert> {
        
        return Binder(base) { base, data in
            let alertController = UIAlertController(title: data.title, message: data.message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            
            alertController.addAction(action)
            
            base.present(alertController,animated: true , completion: nil)
        }
    }
}


```
