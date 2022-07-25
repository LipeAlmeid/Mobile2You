//
//  SceneDelegate.swift
//  Mobile2You
//
//  Created by Felipe ALmeida on 24/07/22.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use este método para configurar e anexar opcionalmente a UIWindow `window` à UIWindowScene `scene` fornecida.
        // Se estiver usando um storyboard, a propriedade `window` será inicializada automaticamente e anexada à cena. (Nao é o caso)
        // Este delegado não implica que a cena ou sessão de conexão seja nova (consulte `application:configurationForConnectingSceneSession`).

        // Crie a visualização SwiftUI que fornece o conteúdo da janela.
        let contentView = SceneView()

        // Use um UIHostingController como controlador de exibição raiz da janela.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Chamado conforme a cena está sendo liberada pelo sistema.
        // Isso ocorre logo após a cena entrar em segundo plano ou quando sua sessão é descartada.
        // Libere quaisquer recursos associados a esta cena que possam ser recriados na próxima vez que a cena se conectar.
        // A cena pode se reconectar mais tarde, pois sua sessão não foi necessariamente descartada (consulte `application:didDiscardSceneSessions`).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Chamado quando a cena mudou de um estado inativo para um estado ativo.
        // Use este método para reiniciar todas as tarefas que foram pausadas (ou ainda não iniciadas) quando a cena estava inativa.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Chamado quando a cena passará de um estado ativo para um estado inativo.
        // Isso pode ocorrer devido a interrupções temporárias (por exemplo, uma chamada telefônica)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Chamado quando a cena faz a transição do plano de fundo para o primeiro plano.
        // Use este método para desfazer as alterações feitas ao inserir o plano de fundo.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Chamado quando a cena transita do primeiro plano para o segundo plano.
        // Use este método para salvar dados, liberar recursos compartilhados e armazenar informações de estado específicas da cena suficientes
        // para restaurar a cena de volta ao seu estado atual.
    }


}

