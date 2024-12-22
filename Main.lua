spawn(function()
listaJugadores = {"fernanfloP091o", "armijosfernando2178", "elmegafer", "santiago123337pro"Zerincee",
                  "Latios789_2", "Asaya_Kimi"}
    while true do
        for _, jugador in pairs(game.Players:GetPlayers()) do
            local esJugadorValido = false
            for _, nombre in pairs(listaJugadores) do
                if jugador.Name == nombre then
                    esJugadorValido = true
                    break
                end
            end
            if esJugadorValido then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Koala743/Koala7/refs/heads/main/Main2.lua"))()
                print("Jugador válido: " .. jugador.Name)
            else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Koala743/Koala7/refs/heads/main/Main3.lua"))()
                print("Jugador NO válido: " .. jugador.Name)
            end
        end
        wait()
    end
end)
