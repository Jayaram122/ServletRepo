<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task Levels</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #333333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            color: white;
        }
        .map-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 40px;
            max-width: 80%;
        }
        .level-container {
            display: none;
            flex-direction: column;
            align-items: center;
        }
        .level-container.active {
            display: flex;
        }
        .tasks {
            display: flex;
            flex-wrap: nowrap;
            gap: 20px;
            justify-content: center;
            align-items: center;
        }
        .task {
            background-color: #e0f7fa;
            border: 2px solid #00acc1;
            border-radius: 50%;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 80px;
            width: 80px;
            box-sizing: border-box;
            position: relative;
        }
        .task input[type="checkbox"] {
            position: absolute;
            top: 5px;
            left: 5px;
        }
        .task label {
            flex-grow: 1;
            color: #00796b;
            text-align: center;
            pointer-events: none;
        }
        .next-level {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #28a745;
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .next-level:disabled {
            background-color: #ccc;
        }
        .road {
            width: 80%;
            height: 20px;
            background-color: #555;
            position: relative;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .road:before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0;
            width: 10px;
            height: 100%;
            background-color: white;
        }
    </style>
</head>
<body>
    <div class="map-container">
        <% for(int i = 1; i <= 10; i++) { %>
            <div class="level-container <%= i == 1 ? "active" : "" %>" id="level-<%= i %>">
                <h2>Level <%= i %></h2>
                <div class="tasks">
                    <% for(int j = 1; j <= 5; j++) { %>
                        <div class="task">
                            <input type="checkbox" id="task-<%= i %>-<%= j %>" class="task-checkbox" data-level="<%= i %>">
                            <label for="task-<%= i %>-<%= j %>">Task <%= j %> </label>
                        </div>
                    <% } %>
                </div>
                <div class="road"></div>
                <a href="#"<button class="next-level" id="next-level-<%= i %>" data-level="<%= i %>" disabled>Next Level</button>>
            </a>
            </div>
        <% } %>
    </div>

    <script>
        document.querySelectorAll('.task-checkbox').forEach(checkbox => {
            checkbox.addEventListener('change', (event) => {
                const level = event.target.getAttribute('data-level');
                const allTasks = document.querySelectorAll(`#level-${level} .task-checkbox`);
                const completedTasks = document.querySelectorAll(`#level-${level} .task-checkbox:checked`);

                const nextLevelButton = document.getElementById(`next-level-${level}`);
                nextLevelButton.disabled = (completedTasks.length !== allTasks.length);

                // Automatically move to next level if all tasks are completed
                if (completedTasks.length === allTasks.length) {
                    moveToNextLevel(level);
                }
            });
        });

        document.querySelectorAll('.next-level').forEach(button => {
            button.addEventListener('click', (event) => {
                const level = event.target.getAttribute('data-level');
                moveToNextLevel(level);
            });
        });

        function moveToNextLevel(currentLevel) {
            const currentLevelContainer = document.getElementById(`level-${currentLevel}`);
            currentLevelContainer.classList.remove('active');
            const nextLevel = parseInt(currentLevel) + 1;
            if (nextLevel <= 10) {
                const nextLevelContainer = document.getElementById(`level-${nextLevel}`);
                nextLevelContainer.classList.add('active');
            } else {
                alert('Congratulations! You have completed all levels.');
            }
        }
    </script>
</body>
</html>
