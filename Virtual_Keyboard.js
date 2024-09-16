        const shortcuts = {
            'Left Ctrl': [
                { keys: ['Ctrl', 'C'], description: '복사 1' },
                { keys: ['Ctrl', 'D'], description: '선택한 항목 삭제' },
                { keys: ['Ctrl', 'V'], description: '붙여넣기' },
                { keys: ['Ctrl', 'X'], description: '잘라내기' },
                { keys: ['Ctrl', 'Z'], description: '실행 취소' },
                { keys: ['Ctrl', 'Y'], description: '다시 실행' },
                { keys: ['Ctrl', 'A'], description: '모두 선택' },
                { keys: ['Ctrl', 'W'], description: '창 닫기' },                             
                { keys: ['Ctrl', '화살표 키', 'Space'], description: '바탕 화면...', tooltip: '바탕 화면 또는 파일 탐색기에서 항목 선택' },
                { keys: ['Ctrl', 'Space'], description: '중국어 IME를 사용...', tooltip: '중국어 IME를 사용하거나 사용하지 않도록 설정' }, 
                { keys: ['Ctrl', 'Esc'], description: '시작 열기' }, 
                { keys: ['Ctrl', 'Insert'], description: '복사 2' }, 
                { keys: ['Ctrl', 'F5'], description: '현재 창을 새로 고침 1' }, 
                { keys: ['Ctrl', 'R'], description: '현재 창을 새로 고침 2' },                
                { keys: ['Ctrl', 'Shift'], description: '키보드 레이아웃 전환' },
                { keys: ['Ctrl', 'Shift', 'T'], description: '닫은 탭 다시 열기' },
                { keys: ['Ctrl', 'Shift', 'Esc'], description: '작업 관리자 열기' },
                { keys: ['Ctrl', 'Shift', '화살표 키'], description: '텍스트...', tooltip: '텍스트 블록 선택' },
                { keys: ['Ctrl', 'Shift', '작업 표시줄의 앱 클릭'], description: '...', tooltip: '앱을 관리자 권한으로 실행' },
                { keys: ['Ctrl', 'Alt', 'Tab'], description: '열려 있는 앱 보기' },
            ],
            'Left Alt': [
                { keys: ['Alt', 'Esc'], description: '열린 창을 순환' },
                { keys: ['Alt', 'Tab'], description: '열린 창 전환' },
                { keys: ['Alt', 'F4'], description: '활성 창 종료' },
                { keys: ['Alt', 'F8'], description: '로그인 화면에서 형식화된 암...', tooltip: '로그인 화면에서 형식화된 암호를 표시' },
                { keys: ['Alt', 'Page Up'], description: '한 화면 위로 이동' },
                { keys: ['Alt', 'Page Down'], description: '한 화면 아래로 이...', tooltip: '한 화면 아래로 이동' },
                { keys: ['Alt', 'Space'], description: '활성 창에 대한 상황에...', tooltip: '활성 창에 대한 상황에 맞는 메뉴를 열기' },
                { keys: ['Alt', '_'], description: '앱에서 밑줄이 그은 문자에 대...', tooltip: '앱에서 밑줄이 그은 문자에 대한 명령을 실행' },
            ],
            'Shift': [
                { keys: ['Shift', '화살표 키'], description: '여러 항목을 선택' },
                { keys: ['Shift', 'F10'], description: '선택한 항목에 대한 상황...', tooltip: '선택한 항목에 대한 상황에 맞는 메뉴를 열기' },
                { keys: ['Shift', '마우스 오른쪽 버튼'], description: '윈도우 11...', tooltip: '윈도우 11에서 윈도우 10 메뉴 호출' },
                { keys: ['Shift', 'Delete'], description: '선택한 항목을 휴지통...', tooltip: '선택한 항목을 휴지통으로 이동하지 않고 삭제' },
            ],
            'Windows': [
                { keys: ['Windows', 'A'], description: '알림 센터 열기' },
                { keys: ['Windows', 'B'], description: '작업 표시줄에서 포커...', tooltip: '작업 표시줄에서 포커스 알림 영역 설정' },
                { keys: ['Windows', 'D'], description: '모든 창을 최소화하거...', tooltip: '모든 창을 최소화하거나 복원' },
                { keys: ['Windows', 'E'], description: '파일 탐색기 열기' },
                { keys: ['Windows', 'F'], description: '피드백 허브 앱을 실행' },
                { keys: ['Windows', 'G'], description: '게임 바 앱을 실행' },
                { keys: ['Windows', 'H'], description: '음성 입력 실행' },
                { keys: ['Windows', 'I'], description: '설정 열기' },
                { keys: ['Windows', 'J'], description: '해당하는 경우 Wind...', tooltip: '해당하는 경우 Windows 10 팁에 포커스를 설정' },
                { keys: ['Windows', 'K'], description: '연결 설정 열기' },
                { keys: ['Windows', 'L'], description: '컴퓨터를 잠금' },                
                { keys: ['Windows', 'M'], description: '모든 창을 최소화' },                
                { keys: ['Windows', 'O'], description: '디바이스 방향을 잠금' },                
                { keys: ['Windows', 'P'], description: '프로젝트 설정 열기' },                
                { keys: ['Windows', 'Q'], description: '검색 창 열기 1' },                
                { keys: ['Windows', 'R'], description: '실행 명령 창 열기' },                
                { keys: ['Windows', 'S'], description: '검색 창 열기 2' },                
                { keys: ['Windows', 'T'], description: '작업 표시줄에서 앱을...', tooltip: '작업 표시줄에서 앱을 순환' },                
                { keys: ['Windows', 'U'], description: '접근성 설정 열기' },                
                { keys: ['Windows', 'V'], description: '클립보드 bin 열기' },                
                { keys: ['Windows', 'W'], description: 'Windows Ink 작...', tooltip: 'Windows Ink 작업 영역 열기' },                
                { keys: ['Windows', 'X'], description: '빠른 링크 메뉴 열기' },                
                { keys: ['Windows', 'Y'], description: '데스크톱과 Mixed...', tooltip: '데스크톱과 Mixed Reality 간의 입력을 변경' },                
                { keys: ['Windows', 'Z'], description: '데스크톱 환경과 W...', tooltip: '데스크톱 환경과 Windows Mixed Reality 간에 입력을 전환' },
                { keys: ['Windows', '/'], description: 'IME 다시 변환을 시...', tooltip: 'IME 다시 변환을 시작(윈11에서 실행 안 됨)' },
                { keys: ['Windows', '-'], description: '돋보기를 사용하여 축소' },
                { keys: ['Windows', ','], description: 'Windows 키를 누르...', tooltip: 'Windows 키를 누르고 있는 동안만 활성화된 모든 창을 숨김' },
                { keys: ['Windows', '.'], description: '이모지 패널 열기 1' },                
                { keys: ['Windows', ';'], description: '이모지 패널 열기 2' },                
                { keys: ['Windows', 'Esc'], description: '돋보기 종료' },
                { keys: ['Windows', 'Tab'], description: '작업 보기 열기' },
                { keys: ['Windows', 'Home'], description: '활성 데스크톱...', tooltip: '활성 데스크톱 창을 제외한 모든 창을 최소화하거나 복원' },
                { keys: ['Windows', 'Prnt Scrn'], description: '전체 화면...', tooltip: '전체 화면을 캡처 및 저장' },
                { keys: ['Windows', 'Pause Break'], description: '시스템...', tooltip: '시스템 속성 표시' },
                { keys: ['Windows', '0-9'], description: '작업 표시줄의 번호...', tooltip: '작업 표시줄의 번호 위치에 있는 앱 열기' },
                { keys: ['Windows', 'Alt', 'D'], description: '작업 표시줄에...', tooltip: '작업 표시줄에서 날짜 및 시간 열기(윈11에서 실행 안 됨)' },
                { keys: ['Windows', 'Alt', '0-9'], description: '작업 표시줄...', tooltip: '작업 표시줄의 번호 위치에 있는 앱의 점프 목록 열기' },
                { keys: ['Windows', 'Ctrl', 'D'], description: '가상 데스크...', tooltip: '가상 데스크톱 만들기' },
                { keys: ['Windows', 'Ctrl', 'F'], description: '도메인 네트워...', tooltip: '도메인 네트워크에서 디바이스에 대한 검색 열기' },
                { keys: ['Windows', 'Ctrl', 'Q'], description: ' 빠른 지원 열기' },
                { keys: ['Windows', 'Ctrl', 'F4'], description: '활성 상태의...', tooltip: '활성 상태의 가상 데스크톱 닫기' },
                { keys: ['Windows', 'Ctrl', '0-9'], description: '작업 표시...', tooltip: '작업 표시줄의 숫자 위치에 있는 앱의 마지막 활성 창으로 전환' },
                { keys: ['Windows', 'Ctrl', 'Enter'], description: '내레이...', tooltip: '내레이터 열기' },
                { keys: ['Windows', 'Ctrl', 'Space'], description: '이전에...', tooltip: '이전에 선택한 입력 옵션을 변경' },
                { keys: ['Windows', 'Ctrl', 'Shift', 'B'], description: '검은...', tooltip: '검은색 또는 빈 화면이 표시되면 디바이스를 깨움' },
                { keys: ['Windows', 'Ctrl', 'Shift', '0-9'], description: '작...', tooltip: '작업 표시줄의 번호 위치에 있는 앱의 관리자 권한으로 다른 인스턴스 열기' },
                { keys: ['Windows', 'Shift', 'M'], description: '데스크톱...', tooltip: '데스크톱에서 최소화된 창을 복원' },
                { keys: ['Windows', 'Shift', 'S'], description: '원하는 영역...', tooltip: '원하는 영역을 드래그하여 캡처 및 저장' },
                { keys: ['Windows', 'Shift', 'V'], description: '알림 순환' },
                { keys: ['Windows', 'Shift', 'Space'], description: '키보드...', tooltip: '키보드 레이아웃 및 입력 언어를 변경(윈11에서 실행 안 됨)' },
                { keys: ['Windows', 'Shift', '0-9'], description: '작업 표시...', tooltip: '작업 표시줄의 숫자 위치에서 다른 앱 인스턴스 열기' },
            ],
            // 다른 키들에 대한 단축키 정보 추가
            'A': [
                { keys: ['Ctrl', 'A'], description: '모두 선택' },
            ],
            'V': [
                { keys: ['Ctrl', 'V'], description: '붙여넣기' },
            ],
            'X': [
                { keys: ['Ctrl', 'X'], description: '잘라내기' },
            ],
            'Z': [
                { keys: ['Ctrl', 'Z'], description: '실행 취소' },
            ],
            'F': [
                { keys: ['Ctrl', 'F'], description: '찾기' },
            ],
            'W': [
                { keys: ['Ctrl', 'W'], description: '창 닫기' },
            ],
            '←': [
                { keys: ['Alt', '←'], description: '뒤로 이동' },
                { keys: ['Windows', 'Shift', '←'], description: '모니터링할...', tooltip: '모니터링할 활성 창을 왼쪽으로 이동' },
                { keys: ['Windows', '←'], description: '앱 또는 창을 왼쪽으로...', tooltip: '앱 또는 창을 왼쪽으로 이동 및 붙힘' },
                { keys: ['Windows', 'Ctrl', '←'], description: '왼쪽의 가상...', tooltip: '왼쪽의 가상 데스크톱으로 전환' },
                { keys: ['Ctrl', '←'], description: '커서를 이전 단어의 시작 부분...', tooltip: '커서를 이전 단어의 시작 부분으로 이동' },
            ],
            '→': [
                { keys: ['Alt', '→'], description: '앞으로 이동' },
                { keys: ['Windows', 'Shift', '→'], description: '모니터링할...', tooltip: '모니터링할 활성 창을 오른쪽으로 이동' },
                { keys: ['Windows', '→'], description: '앱 또는 창을 오른쪽으...', tooltip: '앱 또는 창을 오른쪽으로 이동 및 붙힘' },
                { keys: ['Windows', 'Ctrl', '→'], description: '오른쪽의 가상...', tooltip: '오른쪽의 가상 데스크톱으로 전환' },
                { keys: ['Ctrl', '→'], description: '커서를 다음 단어의 시작 부분...', tooltip: '커서를 다음 단어의 시작 부분으로 이동' },
            ],
            '↑': [
                { keys: ['Windows', '↑'], description: '선택된 창 복원' },
                { keys: ['Windows', 'Shift', '↑'], description: '창을 화면 위...', tooltip: '창을 화면 위쪽과 아래쪽으로 늘임' },
                { keys: ['Ctrl', '↑'], description: '커서를 이전 단락의 시작 부분...', tooltip: '커서를 이전 단락의 시작 부분으로 이동' },
            ],
            '↓': [
                { keys: ['Windows', '↓'], description: '선택된 창 최소화' },
                { keys: ['Windows', 'Shift', '↓'], description: 'Windows...', tooltip: 'Windows 11: 창이 스냅되거나 최대화되면 창을 복원, Windows 10: 너비를 유지하면서 활성 창을 수직으로 최대화하거나 최소화' },
                { keys: ['Ctrl', '↓'], description: '커서를 다음 단락의 시작 부분...', tooltip: '커서를 다음 단락의 시작 부분으로 이동' },
            ],
            // 필요에 따라 다른 키들에 대한 정보도 추가할 수 있습니다.
        };

        function getSpecificShortcuts(key) {
            return shortcuts[key] || [];
        }

        function getUniqueShortcuts(key) {
            const allShortcuts = [];
            const uniqueDescriptions = new Set();
            
            for (const shortcutList of Object.values(shortcuts)) {
                shortcutList.forEach(shortcut => {
                    if (shortcut.keys.includes(key) && !uniqueDescriptions.has(shortcut.description)) {
                        allShortcuts.push(shortcut);
                        uniqueDescriptions.add(shortcut.description);
                    }
                });
            }
            return allShortcuts;
        }

        function highlightKeys(keyArray) {
            document.querySelectorAll('.key').forEach(key => key.classList.remove('active'));
            keyArray.forEach(keyName => {
                const keyElements = document.querySelectorAll('.key');
                keyElements.forEach(keyElement => {
                    const keyText = keyElement.dataset.key || keyElement.textContent.trim();
                    if (keyText.toUpperCase() === keyName.toUpperCase()) {
                        keyElement.classList.add('active');
                    }
                });
            });
        }

        function getSpecificShortcuts(key) {
            return shortcuts[key] || [];
        }

        function getUniqueShortcuts(key) {
            const allShortcuts = [];
            const uniqueDescriptions = new Set();
            
            for (const shortcutList of Object.values(shortcuts)) {
                shortcutList.forEach(shortcut => {
                    if (shortcut.keys.includes(key) && !uniqueDescriptions.has(shortcut.description)) {
                        allShortcuts.push(shortcut);
                        uniqueDescriptions.add(shortcut.description);
                    }
                });
            }
            return allShortcuts;
        }

    function highlightKeys(keyArray) {
        document.querySelectorAll('.key').forEach(key => key.classList.remove('active'));
        keyArray.forEach(keyName => {
            const keyElements = document.querySelectorAll('.key');
            keyElements.forEach(keyElement => {
                const keyData = keyElement.dataset.key;
                if (keyName === '화살표 키' && ['←', '↑', '→', '↓'].includes(keyData)) {
                    keyElement.classList.add('active');
                } else if (keyName === '0-9' && /^[0-9]$/.test(keyData)) {
                    keyElement.classList.add('active');
                } else if (keyData === keyName) {
                    keyElement.classList.add('active');
                }
            });
        });
    }

        function displayShortcuts(key) {
            let relatedShortcuts;
            if (['Left Ctrl', 'Right Ctrl', 'Left Alt', 'Right Alt', 'Win', '화살표 키', '←', '→', '↑', '↓', '0-9'].includes(key)) {
                relatedShortcuts = getSpecificShortcuts(key);
            } else {
                relatedShortcuts = getUniqueShortcuts(key);
            }
                        
            const twoKeyShortcuts = [];
            const threeKeyShortcuts = [];
            const fourKeyShortcuts = [];
            
            relatedShortcuts.forEach(shortcut => {
                const boldKeys = shortcut.keys.map(k => `<strong>${k}</strong>`).join(' + ');
                const tooltipAttr = shortcut.tooltip ? `data-tooltip="${shortcut.tooltip}"` : '';
                const descriptionText = `<span ${tooltipAttr}>${boldKeys} 　<span class="description">${shortcut.description}</span></span>`;
                
                console.log(descriptionText); // 이 줄을 추가
        
                if (shortcut.keys.length === 2) {
                    twoKeyShortcuts.push(descriptionText);
                } else if (shortcut.keys.length === 3) {
                    threeKeyShortcuts.push(descriptionText);
                } else if (shortcut.keys.length === 4) {
                    fourKeyShortcuts.push(descriptionText);
                }
            });
            
            document.getElementById('two-key-shortcuts').innerHTML = 
                 twoKeyShortcuts.length > 0 ? twoKeyShortcuts.join('<br>') : '단축키 없음';
    
            document.getElementById('three-key-shortcuts').innerHTML = 
                 threeKeyShortcuts.length > 0 ? threeKeyShortcuts.join('<br>') : '단축키 없음';
            document.getElementById('four-key-shortcuts').innerHTML = 
                fourKeyShortcuts.length > 0 ? fourKeyShortcuts.join('<br>') : '단축키 없음';


            highlightKeys(relatedShortcuts.flatMap(shortcut => shortcut.keys));
        }

        document.querySelectorAll('.key').forEach(key => {
            key.addEventListener('click', function() {
                const keyData = this.dataset.key;
                displayShortcuts(keyData);
            });
        });
