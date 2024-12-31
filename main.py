from tkinter import *
import clips
import configparser

FONT_SIZE = 13
FONT_TYPE = "Calibri"
LANGUAGE = "ENGLISH"

# Wczytanie pliku properties
config = configparser.ConfigParser()
config.read("src.properties")

root = Tk()
root.geometry("600x400")
root.title("Find on-line game for you!")

frameMain = Frame(root)
frameMain.pack(side="top", expand=True, fill="both")

frameQuestion = Frame(frameMain)
frameQuestion.pack(side="top", expand=True, fill="both")


env = clips.Environment()

def reset_frame(frame, q_text="test", fact_name="test", answers_text=[], answers_clips=[]):
    """ Czyści wszystkie elementy interfejsu. """

    for widget in frame.winfo_children():
        widget.pack_forget()

    Label(frame, text=q_text, font=(FONT_TYPE, FONT_SIZE), wraplength=600).pack(side="top", expand=True, fill="both")

    for i in range(len(answers_clips)):
        Button(frame, font=(FONT_TYPE, FONT_SIZE), text=answers_text[i].replace("#38", "&"), command=lambda arg=answers_clips[i]: assert_fact(fact_name, arg)).pack()

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
    return config[LANGUAGE].get(key, key)

def get_answers(key: str) -> list:
    """ Pobiera odpowiedzi jako listÄ™ z pliku properties. """
    answers = config[LANGUAGE].get(key, "")
    return [ans.strip() for ans in answers.split(";")]

def question(question_key: str, *answers_clips: str):
    """ Wyświetla pytanie oraz dynamicznie wygenerowane przyciski z odpowiedziami. """
    #print(answers_clips)
    question_text = get_text(question_key)
    answers = get_answers(f"{question_key}-answers")
    #print(answers)
    reset_frame(frame=frameQuestion, q_text=question_text, fact_name=question_key, answers_text=answers, answers_clips=answers_clips)      

def show(text_key: str):
    """ Wyświetla komunikat powitalny. """
    text = get_text(text_key)
    reset_frame(frame=frameQuestion, q_text=text, fact_name="start", answers_text=["Next"], answers_clips=["Next"])

def result(result_key: str):
    """ Wyświetla wynik na podstawie klucza. """
    result_text = get_text(result_key)
    reset_frame(frame=frameQuestion, q_text=result_text)

def reset_on_enter(e):
   reset_btn.config(background='OrangeRed3', foreground= "white")

def reset_on_leave(e):
   reset_btn.config(background= 'SystemButtonFace', foreground= 'black')

if __name__ == "__main__":
    reset_btn = Button(frameMain, text="RESET", command=reset_clips, font=(FONT_TYPE, FONT_SIZE), )

    reset_btn.bind('<Enter>', reset_on_enter)
    reset_btn.bind('<Leave>', reset_on_leave)

    reset_btn.pack(pady=20)

    env.define_function(question, name='question')
    env.define_function(result, name='result')
    env.define_function(show, name="show")

    env.load("online_games.clp")

    env.reset()
    env._agenda.run()

    root.mainloop()
