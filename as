npx create-expo-app Aula07Navegacao --template blank
npx react-native init CalculadoraAumento
cd CalculadoraAumento


Form Screen.ja

import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet, Alert } from 'react-native';

const FormScreen = ({ navigation }) => {
    const [productName, setProductName] = useState('');
    const [originalPrice, setOriginalPrice] = useState('');
    const [increasePercentage, setIncreasePercentage] = useState('');

    const handleCalculate = () => {
        if (!productName || !originalPrice || !increasePercentage) {
            Alert.alert("Erro", "Por favor, preencha todos os campos.");
            return;
        }
        navigation.navigate('Result', {
            productName,
            originalPrice: parseFloat(originalPrice),
            increasePercentage: parseFloat(increasePercentage)
        });
    };

    return (
        <View style={styles.container}>
            <TextInput
                style={styles.input}
                placeholder="Nome do Produto"
                value={productName}
                onChangeText={setProductName}
            />
            <TextInput
                style={styles.input}
                placeholder="Valor Original"
                keyboardType="numeric"
                value={originalPrice}
                onChangeText={setOriginalPrice}
            />
            <TextInput
                style={styles.input}
                placeholder="Percentual de Aumento"
                keyboardType="numeric"
                value={increasePercentage}
                onChangeText={setIncreasePercentage}
            />
            <Button title="Calcular" onPress={handleCalculate} />
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        padding: 20,
    },
    input: {
        height: 40,
        borderColor: 'gray',
        borderWidth: 1,
        marginBottom: 20,
        paddingHorizontal: 10,
    },
});

export default FormScreen;




ResultScreen.js

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const ResultScreen = ({ route }) => {
    const { productName, originalPrice, increasePercentage } = route.params;
    const increaseValue = (originalPrice * increasePercentage) / 100;
    const newPrice = originalPrice + increaseValue;

    return (
        <View style={styles.container}>
            <Text style={styles.text}>Produto: {productName}</Text>
            <Text style={styles.text}>Valor Original: R$ {originalPrice.toFixed(2)}</Text>
            <Text style={styles.text}>Aumento: {increasePercentage}%</Text>
            <Text style={styles.text}>Valor do Aumento: R$ {increaseValue.toFixed(2)}</Text>
            <Text style={styles.text}>Novo Valor: R$ {newPrice.toFixed(2)}</Text>
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        padding: 20,
    },
    text: {
        fontSize: 18,
        marginBottom: 10,
    },
});

export default ResultScreen;




App.js

import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import FormScreen from './FormScreen';
import ResultScreen from './ResultScreen';

const Stack = createStackNavigator();

const App = () => {
    return (
        <NavigationContainer>
            <Stack.Navigator initialRouteName="Form">
                <Stack.Screen name="Form" component={FormScreen} options={{ title: 'Calculadora de A