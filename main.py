from tkinter import *
import clips
import configparser
from time import *

FONT_SIZE = 13
FONT_TYPE = "Arial"

# Wczytanie pliku properties
config = configparser.ConfigParser()
config.read("src.properties")

root = Tk()
root.geometry("800x350")
root.resizable(False,False)
root.title("Find on-line game for you!")

frameMain = Frame(root)
frameMain.pack(side="top", expand=True, fill="both")

frameQuestion = Frame(frameMain)
frameQuestion.pack(side="top", expand=True, fill="both")


env = clips.Environment()

def reset_frame(frame, q_text="test", fact_name="test", answers=[]):
    """ Czyści wszystkie elementy interfejsu. """
    count = 0
    size = len(answers)
    for widget in frame.winfo_children():
        if type(widget)==Button and count < size:
            widget.configure(text=answers[count], command=lambda arg=answers[count]: assert_fact(fact_name, arg))
            widget.pack()
            count += 1
        elif type(widget) == Label:
            widget.configure(text=q_text)
        else:
            widget.pack_forget()

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
    return [ans.strip() for ans in answers.split(";")]

def question(question_key: str, fact_name: str):
    """ Wyświetla pytanie oraz dynamicznie wygenerowane przyciski z odpowiedziami. """
    
    question_text = get_text(question_key)
    answers = get_answers(f"{question_key}-answers")

    reset_frame(frame=frameQuestion, q_text=question_text, fact_name=fact_name, answers=answers)      

def show(text_key: str):
    """ Wyświetla komunikat powitalny. """

    text = get_text(text_key)
    reset_frame(frame=frameQuestion, q_text=text, fact_name="start", answers=["Next"])
    #Label(frameQuestion, text=text, font=(FONT_TYPE, FONT_SIZE)).pack(side="top", expand=True, fill="both")
    #Button(frameQuestion, text="Next", font=(FONT_TYPE, FONT_SIZE), command=lambda: assert_fact("start")).pack(side="top", expand=True)

def result(result_key: str):
    """ Wyświetla wynik na podstawie klucza. """
    
    result_text = get_text(result_key)
    reset_frame(frame=frameQuestion, q_text=result_text)
    #Label(frameQuestion, text=result_text, font=(FONT_TYPE, FONT_SIZE)).pack(side="top", expand=True, fill="both")

def reset_on_enter(e):
   reset_btn.config(background='OrangeRed3', foreground= "white")

def reset_on_leave(e):
   reset_btn.config(background= 'SystemButtonFace', foreground= 'black')

if __name__ == "__main__":
    reset_btn = Button(frameMain, text="RESET", command=reset_clips, font=(FONT_TYPE, FONT_SIZE), )

    reset_btn.bind('<Enter>', reset_on_enter)
    reset_btn.bind('<Leave>', reset_on_leave)

    reset_btn.pack(pady=20)

    Label(frameQuestion, text="", font=(FONT_TYPE, FONT_SIZE)).pack(side="top", expand=True, fill="both")
    Button(frameQuestion, font=(FONT_TYPE, FONT_SIZE)).pack()
    Button(frameQuestion, font=(FONT_TYPE, FONT_SIZE)).pack()
    Button(frameQuestion, font=(FONT_TYPE, FONT_SIZE)).pack()
    Button(frameQuestion, font=(FONT_TYPE, FONT_SIZE)).pack()

    env.define_function(question, name='question')
    env.define_function(result, name='result')
    env.define_function(show, name="show")

    env.load("online_games.clp")

    env.reset()
    env._agenda.run()

    root.mainloop()
