
class DogNamesViewModelMapper: Mapper<DogNamesViewModel, DogList> {
    override func reverseMap(value: DogList) -> DogNamesViewModel {
        return DogNamesViewModel(dogNames: value.message)
    }
}
