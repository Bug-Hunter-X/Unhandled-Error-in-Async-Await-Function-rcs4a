func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}

Task { 
    do {
        let data = try await fetchData()
        // Process the data
    } catch {
        print("Error fetching data: \(error)")
    }
}