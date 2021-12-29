
struct DogCeoUseCases {
    private let dogsRepository: DogsRepository
    
    init(dogsRepository: DogsRepository) {
        self.dogsRepository = dogsRepository
    }
    
    func execute(completion: @escaping (DogList?, ErrorModel?) -> Void) {
        dogsRepository.getDogList { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
        
    }
}



//class DOGCEOUseCases {
//    func getDogList(completion....) ->[String] {
//        completion(....)
//    return ["shiba inu", "malamute", "german sheppard"]
//        //Conectar con el repositorio
//        //obtener el modelo
//        //devolver al presenter.
//    }
//}

/*
 Basandote en el onb oarding
 crear el repositorio con su protocolo
 la capa de red con su protocolo
 inyectar el repositorio en el caso de uso
 inyectar la capa de red en el repositorio
 hacer la llamada al servicio en la capa de red
 convertir la data en modelo
 aplicar reglas de negocio si es que hay
 
 aunque no se hace asi: inyectar el caso de uso en el viewcontroller e intentar mostrar listado.
 
 */
