*** Settings ***
Library  SeleniumLibrary
Suite Setup	Abrir navegador
Suite Teardown	Close All Browsers

*** Test Cases ***
Teste CRUD de veterinario
		Dado que o vaterinario seja criado
		Faça a pesquisa do veterinario
		E altere o veterinario
		Então delete o veterinario


*** Keywords ***
Dado que o vaterinario seja criado
		Click Element    xpath:/html/body/div[2]/a[1]/button
		Input Text       id=nome    Joao
		Input Text       id=inputEmail    joao@example.com
		Input Text       id=inputEspecialidade    Medios
		Input Text       id=inputSalario    3000
		Click Element    xpath://button[contains(., 'Cadastrar')]

Faça a pesquisa do veterinario
		Click Element    xpath:/html/body/div[2]/a[2]/button
		Input Text       id=nome    Joao
		Click Element    xpath:/html/body/div[2]/form/div[2]/button

E altere o veterinario
		Click Element    xpath://td[1]/span[contains(.,'Joao')]/../../td[5]/a[1]
		Input Text       id=inputSalario    4000
		Click Element    xpath:/html/body/div[2]/form/div[2]/button

Então delete o veterinario
			Click Element    xpath://td[1]/span[contains(.,'Joao')]/../../td[5]/a[2]

Abrir navegador
		Open Browser    http://localhost:8080/home    Chrome
		Maximize Browser Window
		Set Selenium Speed    0.1s
