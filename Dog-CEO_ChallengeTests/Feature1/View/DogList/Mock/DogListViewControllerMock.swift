@testable import Dog_CEO_Challenge
import UIKit


class DogListViewControllerMock: DogListViewController {

    var dogNamesViewModelMock = DogNamesViewModel(dogNames: ["perro 1", "perro 2"])
}
