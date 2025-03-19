

export default function TelaResutlado({ route, navigation }) {
    const escolha = route.params.escolha
    const link = `api.giphy.com/v1${escolha}/search`
    const [textPesq, setTextPesq] = useState("")
    const[dados,setDados] =useState([])

    const solicitarDados = async (textPesq) => {
        try {
            const resultado = await axios.get(link, {
                params: {
                    api_key: API_KEY,
                    q: textPesq,
                    lang: "pt"
                }
            })
            setDados(resultados.data.data)
        } catch (err) {
            console.log(err)
        }
    }
}