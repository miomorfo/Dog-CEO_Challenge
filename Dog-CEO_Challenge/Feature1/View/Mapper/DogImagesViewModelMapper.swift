class DogImagesViewModelMapper: Mapper<DogImagesViewModel, DogDetail> {
    override func reverseMap(value: DogDetail) -> DogImagesViewModel {
        return DogImagesViewModel(dogImages: value.message)
    }
}

