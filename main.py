from tkinter import *
import clips
import configparser

# Wczytanie pliku properties
config = configparser.ConfigParser()
config.read("src.properties")

root = Tk()
frame = Frame(root)
frame.pack(side="top", expand=True, fill="both")
env = clips.Environment()

def reset_frame():
    """ Czyści wszystkie elementy interfejsu. """
    for widget in frame.winfo_children():
        widget.destroy()

def print_c():
    """ Wyświetla wszystkie fakty CLIPS na konsoli. """
    for i in env.facts():
        print(i)
    print("------")

def assert_fact(fact_name: str, fact_argument: str = ""):
    """ Dodaje fakt do CLIPS i uruchamia agendę reguł. """
    if fact_argument != "":
        fact_argument = " " + fact_argument
    env._facts.assert_string("("+fact_name+fact_argument+")")
    env._agenda.run()
    print_c()

def reset_clips():
    """ Resetuje środowisko CLIPS. """
    env.reset()
    env._agenda.run()

def get_text(key: str) -> str:
    """ Pobiera tekst na podstawie klucza z pliku properties. """
    return config["DEFAULT"].get(key, key)

def get_answers(key: str) -> list:
    """ Pobiera odpowiedzi jako listę z pliku properties. """
    answers = config["DEFAULT"].get(key, "")
    return [ans.strip() for ans in answers.split(",")]

def question(question_key: str, fact_name: str):
    """ Wyświetla pytanie oraz dynamicznie wygenerowane przyciski z odpowiedziami. """
    reset_frame()
    question_text = get_text(question_key)
    answers = get_answers(f"{question_key}-answers")
    
    l = Label(frame, text=question_text)
    l.pack()
    for ans in answers:
        Button(frame, text=ans, command=lambda arg=ans: assert_fact(fact_name, arg)).pack()
    Button(frame, text="RESET", command=reset_clips).pack()

def show(text_key: str):
    """ Wyświetla komunikat powitalny lub informacyjny. """
    reset_frame()
    text = get_text(text_key)
    w = Label(frame, text=text)
    w.pack()
    Button(frame, text="Next", command=lambda: assert_fact("start")).pack()
    Button(frame, text="RESET", command=reset_clips).pack()

def result(result_key: str):
    """ Wyświetla wynik na podstawie klucza. """
    reset_frame()
    result_text = get_text(result_key)
    Label(frame, text=result_text).pack()
    Button(frame, text="RESET", command=reset_clips).pack()

if __name__ == "__main__":
    env.define_function(question, name='question')
    env.define_function(result, name='result')
    env.define_function(show, name="show")

    env.load("online_games.clp")

    env.reset()
    env._agenda.run()

    root.mainloop()
