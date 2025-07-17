pipeline {
    agent any

    environment {
        ROBOT_REPORTS_DIR = 'reports'
        ROBOT_FILE = 'erp-front.robot'
    }

    stages {
        stage('Preparar Ambiente') {
            steps {
                sh '''
                    apt-get update && apt-get install -y \
                        curl wget gnupg python3 python3-pip \
                        nodejs npm libnss3 libatk-bridge2.0-0 libgtk-3-0 \
                        libxss1 libasound2 libxshmfence1 libgbm1 \
                        libxcomposite1 libxrandr2 libpangocairo-1.0-0 libpangoft2-1.0-0

                    pip3 install --upgrade pip
                    pip3 install robotframework robotframework-browser
                    rfbrowser init
                '''
            }
        }

        stage('Executar Testes') {
            steps {
                sh '''
                    mkdir -p ${ROBOT_REPORTS_DIR}
                    robot --outputdir ${ROBOT_REPORTS_DIR} ${ROBOT_FILE}
                '''
            }
        }

        stage('Publicar Relatórios') {
            steps {
                robot outputPath: "${ROBOT_REPORTS_DIR}"
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'reports/**/*', allowEmptyArchive: true
        }
    }
}
