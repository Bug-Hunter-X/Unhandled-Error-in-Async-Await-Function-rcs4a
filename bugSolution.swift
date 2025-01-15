func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return data
    } catch {
        throw error // Re-throw the error for handling at a higher level
    }
}

Task { 
    do {
        let data = try await fetchData()
        // Process the data
    } catch {
        print("Error fetching data: \(error)")
    }
} 