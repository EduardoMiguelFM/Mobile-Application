import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import Home from "../screens/Home";
import Login from "../screens/Login";
import {Feather} from '@expo/vector-icons'

const Tab = createBottomTabNavigator()

export default function TabRoutes(){
    return(
        <Tab.Navigator screenOptions={{headerShown:false}}
        >
            <Tab.Screen  name='home' component={Home}
                options={{tabBarIcon:()=><Feather name='home' size={20} color='red'/>}}
            />

            <Tab.Screen  name='login' component={Login}/>
        </Tab.Navigator>
    )
}