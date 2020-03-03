class Task {
  final String colorval;
  final String task;
  final int taskvalue;

  Task(this.colorval, this.task, this.taskvalue);
  Task.fromMap(Map<String,dynamic> map)
      :assert(map['colorval']!=null),
        assert(map['task']!=null),
        assert(map['taskvalue']!=null),
        colorval=map['colorval'],
        task=map['task'],
        taskvalue=map['taskvalue'];
//@override
//String toString()=> "Record<$colorval$task:$taskvalue>";
}